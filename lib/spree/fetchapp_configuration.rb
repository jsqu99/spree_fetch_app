class Spree::FetchAppConfiguration < Spree::Preferences::Configuration
  preference :app_name, :string
  preference :fetch_app_api_key, :string
  preference :fetch_app_api_token, :string
end
