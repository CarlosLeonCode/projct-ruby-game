require_relative 'view/ruby2d'
require_relative 'model/state'
require 'ruby_jard'

class App

    def self.start
        view = View::Ruby2dView.new
        initial_state = Model::init_state
        jard
        view.render(initial_state)
    end

    def init_timer
        loop do
            sleep 0.5
            # Trigger movement
        end
    end
end

App::start