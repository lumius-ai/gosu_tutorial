require 'gosu'

class Tutorial_Game < Gosu::Window

  def initialize
    # Window size and title
    super(640, 480)
    self.caption = "Tutorial Game"
    
    @background_image = Gosu::Image.new("../media/space.png")
  end

  # Game logic, collision testing, etc
  def update

  end

  # Scene draw, but no logic
  def draw
    @background_image.draw(0,0,0)
  end
end

# Main loop, returns when window is manually closed or .close()
Tutorial_Game.new.show