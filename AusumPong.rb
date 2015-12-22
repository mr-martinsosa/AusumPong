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
  HEIGHT = 80
  WIDTH = 10
  def initialize(window, x, y)
    @window = window
    @x = x
    @y = y
  end

  def update

  end

  def move_up
    @y -= 5
    @y = [HEIGHT/2, @y].max
  end

  def move_down
    @y += 5
    @y = [Game::HEIGHT - HEIGHT/2, @y].min
  end

  def draw
    @window.draw_quad(
        @x-WIDTH/2, @y-HEIGHT/2, Color::BLUE,
        @x+WIDTH/2, @y-HEIGHT/2, Color::BLUE,
        @x+WIDTH/2, @y+HEIGHT/2, Color::BLUE,
        @x-WIDTH/2, @y+HEIGHT/2, Color::BLUE,
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
    if button_down?(KbW)
      @player_1.move_up
    end
    if button_down?(KbS)
      @player_1.move_down
    end
    if button_down?(KbUp)
      @player_2.move_up
    end
    if button_down?(KbDown)
      @player_2.move_down
    end
  end

  def draw
    @ball.draw
    @player_1.draw
    @player_2.draw
  end
end

Game.new.show