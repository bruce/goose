module Goose
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy Goose default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializers
        copy_file 'goose.rb', 'config/initializers/goose.rb'
      end

      def create_nav_directory
        empty_directory "app/views/nav"
        create_file "app/views/nav/.gitkeep", "\n"
      end

    end
  end
end
