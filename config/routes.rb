Rails.application.routes.draw do

  
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks" 
}

devise_scope :user do
  get "/login" => "devise/sessions#new"
end

devise_scope :user do
  delete "/logout" => "devise/sessions#destroy"
end

  get "notification/index"
  get "notification/show"
  root  'about#index'
  get "sessions/create"
  match '/signin',to:'sessions#new',via:'get'
  match '/signout',to:'sessions#destroy',via:'delete'
  match '/search', to: 'search#index', via: 'get'
  match '/search/:id',to: 'search#show',as:'trips_search', via:'get'
  match '/driver/:id',to:'drivers#new',as:'resister_driver', via:'get'
  match '/book/:id',to:'book#show',as:'books_trip',via:'get'
  # match '/notification',to: 'notification#index', via:'get'

  # match '/notification/:id',to: 'notification#show',as:'notification_smtg', via:'get'




  # resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
    get 'book'
    end
  end
  resources :drivers
  resources :reviews

  resources :trips do
    member do
      get 'book'
    end
  end



end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

