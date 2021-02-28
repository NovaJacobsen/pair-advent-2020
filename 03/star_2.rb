$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'route_finder'

slope_trees = [
    RouteFinder.new(@input).count_trees(slope_x: 1, slope_y: 1),
    RouteFinder.new(@input).count_trees(slope_x: 3, slope_y: 1),
    RouteFinder.new(@input).count_trees(slope_x: 5, slope_y: 1),
    RouteFinder.new(@input).count_trees(slope_x: 7, slope_y: 1),
    RouteFinder.new(@input).count_trees(slope_x: 1, slope_y: 2)
]


puts slope_trees.reduce(&:*)