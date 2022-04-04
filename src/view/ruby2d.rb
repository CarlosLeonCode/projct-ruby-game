require 'ruby2d'

module View

    class Ruby2dView
        def initialize
            @pixel_size = 50
        end

        def render(state)
            extend Ruby2D::DSL

            set(title: "Snake game", 
                width: @pixel_size * state.Grid.cols, 
                height: @pixel_size * state.Grid.rows)
            show
        end
    end
end