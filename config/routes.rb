Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :fetch_app_settings

    resources :orders do
      member do 
        get :fetch_app_synch
      end
      collection do 
        get :fetch_app_synch_all
      end
    end
  end
end
