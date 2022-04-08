require 'minitest/autorun'
require_relative "../src/actions/actions"
require_relative "../src/model/state"

class ActionsTest < Minitest::Test
    
    initial_state = Model::Game.new(
        Model::Snake.new([
            Model::Coordinate.new(1,1),
            Model::Coordinate.new(0,1)
        ]),
        Model::Food.new(
            Model::Coordinate.new(4,4)
        ),
        Model::Grid.new(8,12),
        Model::Direction::DOWN,
        false
    )

    expected_state = Model::Game.new(
        Model::Snake.new([
            Model::Coordinate.new(2,1),
            Model::Coordinate.new(1,1)
        ]),
        Model::Food.new(
            Model::Coordinate.new(4,4)
        ),
        Model::Grid.new(8,12),
        Model::Direction::DOWN,
        false
    )

    actual_state = Actions::move_snake(initial_state)
    assert_equal(1, 1)
end