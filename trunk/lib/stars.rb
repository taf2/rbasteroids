# mostly based on http://code.google.com/p/gosu/wiki/RubyTutorial

require 'rubygems'
require 'gosu'
require 'stars/player'
require 'stars/rock'

module ZOrder
  Background, Stars, Player, UI = *0..3
end

class GameWindow < Gosu::Window
	def initialize
		super(640,480,false,20)
		self.caption = "Sample"
		@bg_image = Gosu::Image.new(self, "media/images/space.png", true)
		@player = Stars::Player.new(self)
		@player.warp(320,240)
    @rocks = Stars::Rocks.new( self, 10 )
	end

	def update
    @player.update(self)
    @rocks.update(self)
	end

	def draw
		@player.draw(self)
    @rocks.draw
		@bg_image.draw(0,0,0)
	end

	def button_down(id)
		if id == Gosu::Button::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show
