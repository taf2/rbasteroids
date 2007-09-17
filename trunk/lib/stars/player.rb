require 'stars/object'
module Stars
  class Player < Stars::Object
    include Stars::Controllable 

    def initialize( window )
      super( window, "media/images/starfighter.png" )
			@fire = false
    end

    def update( window )
      keyboard_movement( window )
			if window.button_down?( Gosu::Button::KbSpace )
				@fire = true
			else
				@fire = false
			end
    end

		def draw( window )
			super()
			if @fire
				offset_x = 100 * Gosu::offset_x(@angle, 1.0)
				offset_y = 100 * Gosu::offset_y(@angle, 1.0)
				x2 = @x + offset_x
				y2 = @y + offset_y
				window.draw_line(@x, @y, Gosu::Color.new(0xffff0000),
												 x2, y2, Gosu::Color.new(0x88ff0000), 
												 1, :default)
			end
		end

  end
end
