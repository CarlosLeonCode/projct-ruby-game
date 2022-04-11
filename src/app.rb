require_relative 'view/ruby2d'
require_relative 'model/state'
require_relative 'actions/actions'
require 'ruby_jard'

class App

    def initialize
        @state = Model::init_state
    end

    def start
        @view = View::Ruby2dView.new(self)
        Thread.new{ init_timer(@view) }  
        @view.start(@state)
    end

    def init_timer(view)
        loop do
            # Trigger movement
            @state = Actions::move_snake(@state)
            @view.render_scene(@state)
            sleep 0.5
        end
    end

    def send_action(action, params)
        new_state = Actions.send(action,  @state, params)
        if @state.hash != new_state.hash
            @state = new_state
            @view.start(@state)
        end
    end
end

game = App.new
game.start