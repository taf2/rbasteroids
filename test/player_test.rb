require File.join(File.dirname(__FILE__), 'help')
require 'stars/player'

class PlayerTest < Test::Unit::TestCase

	def setup
		@window = mock()
		@window.stubs(:width).returns( 640 )
		@window.stubs(:height).returns( 480 )

		@image = stub( :width => 100, :height => 150 )
		Gosu::Image.expects(:new).with( @window, "media/images/starfighter.png", true ).returns( @image )
		@player = Stars::Player.new( @window )
	end

	def test_can_move_to_the_left
		@window.expects(:button_down?).with( Gosu::Button::KbLeft ).returns( true )
		@window.expects(:button_down?).with( Gosu::Button::KbRight ).returns( false )
		@window.expects(:button_down?).with( Gosu::Button::GpRight ).returns( false )
		@window.expects(:button_down?).with( Gosu::Button::KbUp ).returns( true )

		@player.update( @window )
		assert -4.5, @player.angle
		assert 0.5, @player.accel
		assert_in_delta 639.96, @player.x, 0.01
		assert_in_delta 479.50, @player.y, 0.01
		assert_in_delta -0.4735, @player.vel_y, 0.01
		assert_in_delta -0.0372, @player.vel_x, 0.01
	end

end
