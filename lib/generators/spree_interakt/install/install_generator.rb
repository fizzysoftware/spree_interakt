module SpreeInterakt
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def self.source_root
        File.dirname(__FILE__)
      end

      argument :app_id, :desc => "Your interakt Project APP ID, which can be found here: https://interakt.co/projects/XXXXXXXXXXXXX/api_info"
      argument :api_key, :desc => "Your interakt Project API KEY, which can be found here: https://interakt.co/projects/XXXXXXXXXXXXX/api_info"

      def create_initializer_file
        @app_id = app_id
        @api_key = api_key

        template("interakt.rb.erb", "config/initializers/interakt.rb")
      end
    end
  end
end
