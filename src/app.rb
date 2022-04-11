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
        # jard
        thread_ref = Thread.new{ init_timer(@view) }  
        @view.start(@state)
        thread_ref.join
    end

    def init_timer(view)
        loop do
            if @state.game_finished
                puts "Game finished!"
                puts "Points #{@state.snake.positions.length}"
                break
            end
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