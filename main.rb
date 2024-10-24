require 'gosu'
require_relative "lib/player"
require_relative "lib/star"
require_relative "lib/ZOrder"

class Tutorial_Game < Gosu::Window
  include ZOrder

  def initialize
    # Window size and title
    super(640, 480)
    self.caption = "Tutorial Game"
    
    @background_image = Gosu::Image.new("media/space.png")

    # Create a player in the center position
    @player = Player.new()
    @player.warp(320, 240)

    # Create stars
    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new()
  end

  # Game logic, collision testing, etc
  def update
    # Button motion controls
    if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end

    # Calculate new x, y and collect nearby stars
    @player.move()
    @player.collect_stars(@stars)

    # Create new star if there are less than 25
    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
    end

  end

  # Scene draw, but no logic
  def draw
    @player.draw()
    @background_image.draw(0,0,0)
    @stars.each{|star| star.draw()}

  end
end

# Main loop, returns when window is manually closed or .close()
Tutorial_Game.new.show