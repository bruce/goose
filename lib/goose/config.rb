module Goose

  class Config

    attr_writer :wrapper_tag, :active_options, :inactive_options

    def wrapper_tag
      @wrapper_tag ||= :li
    end

    def active_options
      @active_options ||= {:class => 'active'}
    end

    def inactive_options
      @inactive_options ||= {}
    end

  end


end
