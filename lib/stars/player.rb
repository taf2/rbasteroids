require 'stars/object'
module Stars
  class Player < Stars::Object
    include Stars::Controllable 

    def initialize( window )
      super( window, "media/images/starfighter.png" )
    end

    def update( window )
      keyboard_movement( window )
    end

  end
end
