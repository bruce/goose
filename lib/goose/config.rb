module Goose

  class Config

    attr_writer :wrapper_tag, :active_options, :inactive_options, :breadcrumb_linker

    def wrapper_tag
      @wrapper_tag ||= :li
    end

    def active_options
      @active_options ||= {:class => 'active'}
    end

    def breadcrumb_linker
      @breadcrumb_linker ||= lambda { |view, *args| view.link_to(*args) }
    end

    def inactive_options
      @inactive_options ||= {}
    end

  end


end
