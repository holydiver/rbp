require "enumerator"

module LazyStream
  
  class Node
    def initialize( head, &promise )
      @head, @tail = head, promise
    end
    
    attr_reader  :head
    alias_method :current, :head

    def head
      @transformer.nil? ? @head : @transformer[@head]
    end

    def tail
      result = if @tail.is_a? Proc
        @tail.call
      else
        @tail
      end

      result.filter(@filter) unless @filter.nil? or not result.is_a? self.class

      result.transform(&@transformer) unless @transformer.nil? or not result.is_a? self.class

      result
    end
    alias_method :next, :tail
    
    def drop
      result, next_stream = head, tail
      @head, @tail = if next_stream.is_a? self.class
        next_stream.instance_eval { [@head, @tail] }
      else
        Array(next_stream)
      end
      result
    end
    alias_method :tail!, :drop
    alias_method :next!, :drop
    
    def end?
      @tail.nil?
    end

    def next?
      not end?
    end
    
    def show( *limit_and_options )
      options = {:sep => " ", :end => "\n"}.merge!(
        limit_and_options.last.is_a?(Hash) ? limit_and_options.pop : Hash.new
      )
      limit = limit_and_options.shift

      each(limit) { |cur| print cur, options[:sep] }
      print options[:end]
    end
    alias_method :display, :show
    
    def each!( limit = nil )
      loop do
        break unless limit.nil? or (limit -= 1) > -1

        yield drop

        break if end?
      end

      self
    end
    
    def each( limit = nil, &block )
      clone.each!(limit, &block)

      self
    end
    
    alias_method :peek, :each
    
    include Enumerable
    
    def limit( max_depth = nil )
      enum_for(:each, max_depth)
    end

    def limit!( max_depth = nil )
      enum_for(:each!, max_depth)
    end

    def filter(pattern=nil, &block)
      @filter = pattern || block
      
      drop until matches_filter? @head

      self
    end

    def transform( &transformer)
      @transformer = transformer
      
      self
    end

    private

    def matches_filter?(current)
      case @filter
      when nil
        true
      when Proc
        @filter[current]
      else
        @filter === current
      end
    end
  end
end

module Kernel
  def lazy_stream( *args, &block )
    LazyStream::Node.new(*args, &block)
  end
end
