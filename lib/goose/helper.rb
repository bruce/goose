module Goose

  module Helper

    def goose
      @goose ||= State.new(self)
    end

    def nav_to(place, url = nil, options = {}, &block)
      if goose.at?(place)
        goose.current_address.resolve(url)
        options.update(Goose.config.active_options)
      end
      content = url ? link_to(place, url) : ''.html_safe
      content << capture(&block) if block
      content_tag(Goose.config.wrapper_tag, content, options)
    end
    
    def nav_at(*places)
      options = places.last.is_a?(Hash) ? places.pop : {}
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
          Goose.config.breadcrumb_linker.call(self, *crumb)
        else
          crumb
        end
      end
    end
    
  end
  
end
