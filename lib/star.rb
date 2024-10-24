require 'gosu'
require_relative "ZOrder"

class Star 
  attr_reader :x, :y

  include ZOrder

  def initialize(animation)
    # animation is an array of frames
    @animation = animation
    @color = Gosu::Color::BLACK.dup

    # Setting RGB values
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40

    # Random position on board
    @x = rand * 640
    @y = rand * 480
  end

  def draw
    img = @animation[Gosu.milliseconds / 100 % @animation.size]
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
    ZOrder::STARS, 1, 1, @color, :add)
  end

end
