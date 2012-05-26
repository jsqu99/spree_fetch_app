Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :fetchapp_settings

    resources :orders do
      member do 
        get :fetchapp_synch
      end
      collection do 
        get :fetchapp_synch_all
      end
    end
  end
end
