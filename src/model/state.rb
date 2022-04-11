module Model

    module Direction
        UP = :up
        DOWN = :down
        RIGHT = :right
        LEFT = :left
    end

    class Coordinate < Struct.new(:row, :col); end

    class Food < Coordinate; end

    class Snake < Struct.new(:positions); end

    class Grid < Struct.new(:rows, :cols); end

    class Game < Struct.new(:snake, :food, :grid, :current_direction, :game_finished); end

    def self.init_state
        Model::Game.new(
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
    end
end