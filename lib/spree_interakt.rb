require 'spree_core'
require 'spree_interakt/engine'
require 'spree_interakt/import'
require 'spree_interakt/railtie'
require 'active_support'

module SpreeInterakt
  class Setting
    cattr_accessor :app_id, :api_key
  end

  def self.config
    block_given? ? yield(Setting) : Setting
  end

end
