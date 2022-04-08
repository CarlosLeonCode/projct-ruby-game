require 'ruby2d'
require_relative '../model/shapes'

module View

    class Ruby2dView
        def initialize
            @pixel_size = 50
        end

        def start(state)
            extend Ruby2D::DSL

            set(title: "Snake game", 
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows)
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
    end

end