module SpreeInterakt
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'spree_interakt/interakt.rake'
    end
  end
end
