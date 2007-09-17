require 'stars/object'
module Stars
  class Rock < Stars::Object
    def initialize( window )
      super( window, "media/images/mid-rock.png", :accel => (0.1 * rand(0.01)), 
                                                  :angle => rand(window.width) )
    end

    def update( window )
      accelerate
      move
    end
  end

  class Rocks
    def initialize( window, count, avoid = {:x => 320, :y => 240} )
      @rocks = []
      count.times do |c|
        rock = Stars::Rock.new(window)
        x = rand(window.width)
        y = rand(window.height)
        dist = Gosu::distance(x,y,avoid[:x], avoid[:y])
        if dist < 5
          x += 100
          y += 100
        end
        rock.warp(x,y)
        @rocks << rock
      end
    end

    def update( window )
      @rocks.each do|rock|
        rock.update( window )
      end
    end

    def draw
      @rocks.each do|rock|
        rock.draw
      end
    end

  end
end
