module SpreeInterakt
  module UserValidator

    def check_basic_validation
      raise 'We only supports ActiveRecord' unless (defined?(ActiveRecord::Base))
      raise "You have to add 'app_id' in your 'config/initializers/interakt.rb' file first" unless SpreeInterakt.config.app_id.present?
      raise "You have to add 'api_key' in your 'config/initializers/interakt.rb' file first" unless SpreeInterakt.config.api_key.present?
    end

    def verify_reponse( response)
      raise "Your 'app_id' or 'api_key' is not corrent. Please correct it in 'config/initializers/interakt.rb'" if response.code.to_i == 401
      raise "Something went wrong. Please report the issue." if response.code.to_i == 500
      raise "Got #{response.code}" if response.code.to_i == 404
      response_verified = true
    end

  end
end
