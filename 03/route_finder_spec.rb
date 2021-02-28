$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'route_finder'
require 'rspec'

test_input = <<EOI.chomp.each_line.map(&:to_str)
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
EOI

describe RouteFinder do
    it 'creates a map from a template that is at least three times as wide as it is high' do
        route_finder = RouteFinder.new test_input
        expect(route_finder.terrain[0].length).to be >= 33
    end

    it 'counts the amount of trees on the slope defined as 3 right, 1 down' do
        expect(RouteFinder.new(test_input).count_trees).to eq 7
    end

    it 'counts the amount of trees on a specified slope' do
        expect(RouteFinder.new(test_input).count_trees(slope_x: 1, slope_y: 1)).to eq 2
        expect(RouteFinder.new(test_input).count_trees(slope_x: 3, slope_y: 1)).to eq 7
        expect(RouteFinder.new(test_input).count_trees(slope_x: 5, slope_y: 1)).to eq 3
        expect(RouteFinder.new(test_input).count_trees(slope_x: 7, slope_y: 1)).to eq 4
        expect(RouteFinder.new(test_input).count_trees(slope_x: 1, slope_y: 2)).to eq 2
    end
end

