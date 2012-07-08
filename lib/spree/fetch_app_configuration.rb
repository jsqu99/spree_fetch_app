class Spree::FetchAppConfiguration < Spree::Preferences::Configuration
  preference :app_name, :string
  preference :api_key, :string
  preference :api_token, :string
end
