class Spree::FetchAppConfiguration < Spree::Preferences::Configuration
  preference :app_name, :string
  preference :api_key, :string
  preference :api_token, :string
  preference :push_on_order_complete, :boolean, :default => false
end
