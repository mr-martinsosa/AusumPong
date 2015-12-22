require 'gosu'
include Gosu

class Ball
  attr_accessor :x, :y
  def initialize(window)
    @window = window
    @x = Game::WIDTH/2
    @y = Game::HEIGHT/2
    @vx = 5
    @vy = 0
  end

  def update
    @x += @vx
    @y += @vy
    if @y > Game::HEIGHT || @y < 0
      @vy *= -1
    end
  end

  def draw
    @window.draw_quad(
      @x-5, @y-5, Color::BLUE,
      @x+5, @y-5, Color::BLUE,
      @x+5, @y+5, Color::BLUE,
      @x-5, @y+5, Color::BLUE,
    )
  end

  def switch_direction(place_on_paddle)
    @vx *= -1
    @vy = place_on_paddle / 10
  end
end

class Player
  attr_accessor :x, :y
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

  def hits?(ball)
    (@x - ball.x).abs < 5 && (@y - ball.y).abs < 50
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

    if @player_1.hits?(@ball)
      @ball.switch_direction(@ball.y - @player_1.y)
    end

    if @player_2.hits?(@ball)
      @ball.switch_direction(@ball.y - @player_2.y)
    end
    @ball.update
  end

  def draw
    @ball.draw
    @player_1.draw
    @player_2.draw
  end
end

Game.new.show