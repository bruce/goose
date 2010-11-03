module Goose

  class State

    def initialize(view)
      @view = view
      @stack ||= []
    end

    def render(nav, place)
      at(nav, place) { @view.render(:partial => "nav/#{nav}") }
    end

    def at?(place)
      @stack.last == place
    end

    private

    def at(nav, place, &block)
      @stack << place
      result = yield
      @stack.pop
      result
    end
    
  end

end
