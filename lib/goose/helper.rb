module Goose

  module Helper

    def goose
      @goose ||= State.new(self)
    end

    def nav_to(place, url, options = {}, &block)
      if goose.at?(place)
        goose.current_address.resolve(url)
        options.update(Goose.config.active_options) do |k,v1,v2|
          k.to_s == 'class' ? "#{v1} #{v2}" : v2
        end
      end
      content = link_to(place, url) if url
      content_tag(Goose.config.wrapper_tag, content, options, &block)
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
