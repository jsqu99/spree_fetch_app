class Spree::FetchappConfiguration < Spree::Preferences::Configuration
  preference :app_name, :string
  preference :login, :string
  preference :password, :string
end
