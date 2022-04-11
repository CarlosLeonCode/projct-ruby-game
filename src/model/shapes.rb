require 'ruby2d'

module Shapes
    extend Ruby2D::DSL

    def self.square(x:, y:, color:, pxl_size:)
        Square.new(
            x: x * pxl_size, 
            y: y * pxl_size,
            size: pxl_size,
            color: Color.new(color)
        )
    end
end