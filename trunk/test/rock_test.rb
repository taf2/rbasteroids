require File.join(File.dirname(__FILE__), 'help')
require 'stars/rock'

class RockTest < Test::Unit::TestCase

	def setup
		@window = mock()
		@window.stubs(:width).returns( 640 )
		@window.stubs(:height).returns( 480 )

		@image = stub( :width => 100, :height => 150 )
		Gosu::Image.expects(:new).with( @window, "media/images/mid-rock.png", true ).returns( @image )
		@rock = Stars::Rock.new( @window )
	end

	def test_rock_moves
		@rock.update( @window )
		assert_not_equal 0, @rock.angle
		assert_not_equal 0.0, @rock.accel
		assert_not_equal 0.0, @rock.x
		assert_not_equal 0.0, @rock.y
		assert_not_equal 0.0, @rock.vel_y
		assert_not_equal 0.0, @rock.vel_x
	end

end
