require 'ruby2d'
require_relative '../model/shapes'

module View

    class Ruby2dView
        def initialize(app)
            @pixel_size = 50
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL

            set(title: "Snake game", 
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows)            
            
            on :key do |event|
                on_keyboard_event_handler(event)
            end
            show
        end

        def render_scene(state)
            extend Ruby2D::DSL
            clear
            render_food(state)
            render_snake(state)
        end

        private

        def render_food(state)
            food = state.food.first
            Shapes::square( x: food.col, y: food.row, color: 'yellow', pxl_size: @pixel_size )
        end

        def render_snake(state)
            snake = state.snake.positions
            snake.each do |pos|
                Shapes::square( x: pos.col, y: pos.row, color: 'green', pxl_size: @pixel_size )
            end
        end

        def on_keyboard_event_handler(event)
            case event.key
            when 'up'
                @app.send_action(:change_direction, Model::Direction::UP)
            when 'down'
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when 'left'
                @app.send_action(:change_direction, Model::Direction::LEFT)
            when 'right'
                @app.send_action(:change_direction, Model::Direction::RIGHT)
            end
        end
    end

end