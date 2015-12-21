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
      Game::WIDTH/2-5, Game::HEIGHT/2-5, Color::BLUE,
      Game::WIDTH/2+5, Game::HEIGHT/2-5, Color::BLUE,
      Game::WIDTH/2+5, Game::HEIGHT/2+5, Color::BLUE,
      Game::WIDTH/2-5, Game::HEIGHT/2+5, Color::BLUE,
    )
  end
end

class Player
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
  end

  def update

  end

  def draw
    @window.draw_quad(
        @x-5, @y-40, Color::BLUE,
        @x+5, @y-40, Color::BLUE,
        @x+5, @y+40, Color::BLUE,
        @x-5, @y+40, Color::BLUE,
    )
  end
end

class Game < Window
  WIDTH = 640
  HEIGHT = 480
  def initialize
    super(WIDTH, HEIGHT, false)
    @ball = Ball.new(self)
    @player_1 = Player.new(self, 40, HEIGHT/2)
    @player_2 = Player.new(self, WIDTH-40, HEIGHT/2)
  end

  def update

  end

  def draw
    @ball.draw
    @player_1.draw
    @player_2.draw
  end
end

Game.new.show