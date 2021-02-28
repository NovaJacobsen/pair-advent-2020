$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'route_finder'

puts RouteFinder.new(@input).count_trees