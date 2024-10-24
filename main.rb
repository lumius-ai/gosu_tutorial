require 'gosu'
require_relative "lib/player"

class Tutorial_Game < Gosu::Window

  def initialize
    # Window size and title
    super(640, 480)
    self.caption = "Tutorial Game"
    
    @background_image = Gosu::Image.new("media/space.png")

    # Create a player in the center position
    @player = Player.new()
    @player.warp(320, 240)
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
    @player.move
  end

  # Scene draw, but no logic
  def draw
    @player.draw()
    @background_image.draw(0,0,0)

  end
end

# Main loop, returns when window is manually closed or .close()
Tutorial_Game.new.show