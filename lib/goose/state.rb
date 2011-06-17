module Goose

  class State

    def initialize(view)
      @view = view
      @stack ||= []
    end

    def render(nav, address)
      at(nav, address) { @view.render(:partial => "nav/#{nav}") }
    end

    def at?(place)
      current_address.at?(place)
    end

    def breadcrumbs
      current_address.breadcrumbs
    end
    
    def current_address
      @stack.last
    end

    private
    
    def at(nav, address, &block)
      @stack << address
      result = yield
      @stack.pop
      result
    end
    
  end

end
