module Stars

  module Controllable
    def keyboard_movement( window )
      if window.button_down?( Gosu::Button::KbLeft ) or
         window.button_down?( Gosu::Button::GpLeft )
        turn_left
      end

      if window.button_down?( Gosu::Button::KbRight ) or
         window.button_down?( Gosu::Button::GpRight )
        turn_right
      end

      if window.button_down?( Gosu::Button::KbUp ) or
         window.button_down?( Gosu::Button::GpButton0 )
        accelerate
      end
      move
    end
  end

  class Object
    attr_reader :x, :y, :width, :height, :angle, :vel_x, :vel_y

    def initialize( window, image_path, options = {} )
      @image = Gosu::Image.new(window,image_path,true)
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @angle = options[:angle] || 0.0
      @accel = options[:accel] || 0.5
    end

    def width
      @image.width
    end

    def height
      @image.height
    end

    def warp(x,y)
      @x, @y = x, y
    end

    def turn_left
      @angle -= 4.5
    end

    def turn_right
      @angle += 4.5
    end

    def accelerate
      @vel_x += Gosu::offset_x(@angle, @accel)
      @vel_y += Gosu::offset_y(@angle, @accel)
    end

    def move
      @x += @vel_x
      @y += @vel_y
      @x %= 640
      @y %= 480
      @vel_x *= 0.95
      @vel_y *= 0.95
    end

    def update( window )
    end

    def draw
      @image.draw_rot(@x,@y,1,@angle)
    end
  end
end
