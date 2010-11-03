module Goose

  module Helper

    def goose
      @goose ||= State.new(self)
    end

    def nav_to(place, url, options = {}, &block)
      if goose.at?(place)
        options.update(Goose.config.active_options)
      end
      content = link_to(place, url) if url 
      content_tag(Goose.config.wrapper_tag, content, options, &block)
    end
    
    def nav_at(place, options = {})
      nav = options[:in] || :main
      goose.render(nav, place)
    end
    
    def nav(name = nil)
      nav_at(nil, :in => name)
    end
    
  end
  
end
