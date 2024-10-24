# Game player class
require 'gosu'

class Player
  def initialize
    @image = Gosu::Image.new("media/starfighter.bmp")
    # Position and velocities + score zeroed out
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0

  end

  # Change position to given coords
  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5

  end

  def turn_right
    @angle += 4.5
  end

  # Convert angular motion to x and y displacement
  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end


  # Shifts player x, y making sure not to exceed window size. Natural deceleration
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  # Return score
  def score
    return @score
  end

  # Collecting stars
  def collect_stars(stars)
    # Delete any stars nearby
    stars.reject! { |star| Gosu.distance(@x, @y, star.x, star.y) < 35 }
  end

  # Draw rot to center image on given coordinates
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end