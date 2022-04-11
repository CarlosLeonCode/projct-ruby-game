require_relative '../model/state'

module Actions

    def self.move_snake(state)
        direction = state.current_direction

        new_position = calc_next_position(state)

        if position_is_valid?(state, new_position)
            move_snake_to(state, new_position)
        else 
            end_game(state)
        end
    end

    def self.change_direction(state, direction)
       if current_direction_is_valid?(state, direction)
            state.current_direction = direction
       else
            puts "Invalid direction"
       end
       state
    end

    private

    def self.calc_next_position(state)
        current_position = state.snake.positions.first

        case state.current_direction    
        when :up
            # Decrement Row
            new_row = current_position.row - 1
            col = current_position.col
            return Model::Coordinate.new(new_row, col) 
        when :down
            # Increment Row
            new_row = current_position.row + 1
            col = current_position.col
            return Model::Coordinate.new(new_row, col) 
        when :right
            # Increment Column
            new_row = current_position.row
            col = current_position.col + 1
            return Model::Coordinate.new(new_row, col) 
        when :left
            # Decrement Column
            new_row = current_position.row
            col = current_position.col - 1
            return Model::Coordinate.new(new_row, col)
        end
    end

    def self.position_is_valid?(state, new_position)
        is_invalid = (
            (new_position.row >= state.grid.rows || new_position.row < 0) ||
            (new_position.col >= state.grid.cols || new_position.col < 0)
        )
        return false if is_invalid

        is_invalid = state.snake.positions.include?(new_position)
        return is_invalid ? false : true
    end

    def self.move_snake_to(state, new_position)
        new_coordinates = [new_position] + state.snake.positions[0...-1]
        state.snake.positions = new_coordinates
        state
    end

    def self.end_game(state)
        state.game_finished = true
        state
    end

    def self.current_direction_is_valid?(state, direction)
        case state.current_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        else
            return false
        end
    end
end