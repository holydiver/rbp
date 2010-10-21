# a/b.rb
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include? dir

require 'b/c'
require 'b/d'
