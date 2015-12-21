require 'gosu'
include Gosu

class Ball
  def initialize(window)
    @window = window
  end

  def update

  end

  def draw
    @window.draw_quad(
      10, 10, Color::BLUE,
      20, 10, Color::BLUE,
      20, 20, Color::BLUE,
      10, 20, Color::BLUE,
    )
  end
end

class Game < Window
  def initialize
    super(640, 480, false)
    @ball = Ball.new(self)
  end

  def update

  end

  def draw
    @ball.draw
  end
end

Game.new.show