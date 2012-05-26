module SpreeFetchapp
  class Engine < Rails::Engine
    engine_name 'spree_fetchapp'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.fetchapp.preferences", :after => "spree.environment" do |app|
      SpreeFetchapp::Config = Spree::FetchappConfiguration.new
    end

    # Activate the variant sku observer
    config.active_record.observers = "Spree::VariantObserver".to_sym
  end
end
