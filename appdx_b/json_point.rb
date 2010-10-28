require 'json'

class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def distance_to(point)
    Math.hypot(point.x - x, point.y - y)
  end

  attr_reader :x, :y

  def to_json(*args)
    { 'json_class' => self.class.name,
      'data' => [@x, @y] }.to_json(*args)
  end

  def self.json_create(obj)
    new(*obj['data'])
  end
end

point_a = Point.new(1,2)
puts point_a.to_json #=> {"json_class":"Point", "data":[1,2]}

point_b = JSON.parse('{"json_class":"Point", "data":[4,6]}')
puts point_b.distance_to(point_a) #=> 5.0
