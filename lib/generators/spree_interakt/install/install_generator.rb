module SpreeInterakt
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def self.source_root
        File.dirname(__FILE__)
      end

      argument :app_id, :desc => "Your interakt Project App-id, which can be found here: https://www.interakt.co/api_keys"
      argument :api_key, :desc => "Your interakt Project Api-key, which can be found here: https://www.interakt.co/api_keys"

      def create_initializer_file
        @app_id = app_id
        @api_key = api_key

        template("interakt.rb.erb", "config/initializers/interakt.rb")
      end

      # def add_javascripts
      #   append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_interakt\n"
      #   append_file 'app/assets/javascripts/admin/all.js', "//= require admin/spree_interakt\n"
      # end

      # def add_stylesheets
      #   inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_interakt\n", :before => /\*\//, :verbose => true
      #   inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_interakt\n", :before => /\*\//, :verbose => true
      # end

      # def add_migrations
      #   run 'bundle exec rake railties:install:migrations FROM=spree_interakt'
      # end

      # def run_migrations
      #   run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
      #   if run_migrations
      #     run 'bundle exec rake db:migrate'
      #   else
      #     puts 'Skipping rake db:migrate, don\'t forget to run it!'
      #   end
      # end

    end
  end
end
