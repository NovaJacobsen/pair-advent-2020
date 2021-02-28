class RouteFinder
    def initialize terrain_template
        @terrain = create_terrain terrain_template
    end

    def create_terrain template
        
        return template.map {|line| 
            line.rstrip!
            line.lstrip!
            line
        }
    end

    def count_trees(slope_x: 3, slope_y: 1)
        tree_count = 0
        repeated_terrain = terrain(slope_factor: (slope_x/slope_y.to_f).ceil)
        for y_coord in 0..(repeated_terrain.length/slope_y)-1
            tree_count += 1 if repeated_terrain[y_coord*slope_y][y_coord*slope_x] == "#"
        end
        return tree_count
    end

    def terrain(slope_factor: 3)
        return @terrain.map {|line| 
            line * (@terrain.length/line.length.to_f).ceil * slope_factor
        }
    end
end