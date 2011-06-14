module Goose

  module Helper

    def goose
      @goose ||= State.new(self)
    end

    def nav_to(place, url, options = {}, &block)
      if goose.at?(place)
        goose.current_address.resolve(url)
        options.update(Goose.config.active_options)
      end
      content = link_to(place, url) if url
      content_tag(Goose.config.wrapper_tag, content, options, &block)
    end
    
    def nav_at(*places)
      options = places.last.is_a?(Hash) ? args.pop : {}
      nav = options[:in] || :main
      address = Address.new(*places)
      goose.render(nav, address)
    end
    
    def nav(name = nil)
      nav_at(nil, :in => name)
    end

    def breadcrumbs
      goose.current_address.map do |crumb|
        if crumb.is_a?(Array)
          link_to(*crumb)
        else
          crumb
        end
      end
    end
    
  end
  
end
