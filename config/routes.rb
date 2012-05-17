Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :fetchapp_settings

    resources :orders do
      collection do 
        get :fetchapp_synch
      end
    end
  end
end
