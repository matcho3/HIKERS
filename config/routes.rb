Rails.application.routes.draw do

  
  # get "sample_pages/index"
  # post "sample_pages/purchase"
  # get "sample_pages/purchased"
  get "trips/show"
  post "trips/purchase"
  get "trips/purchased"
  devise_for :users, :controllers => {
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks" 
}

devise_scope :user do
  get 'login', :to => 'users/sessions#new', :as => :new__session
  get 'logout', :to => 'users/sessions#destroy', :as => :destroy_session
end


  get "notification/index"
  get "notification/show"
  root  'about#index'
  # get "sessions/create"
  # match '/signup',to:'users#new',via:'get'
  # match '/signout',to:'sessions#destroy',via:'delete'
  match '/notification', to:'users#notification',via:"get"
  match '/search', to: 'search#index', via: 'get'
  match '/search/:id',to: 'search#show',as:'trips_search', via:'get'
  match '/driver/:id',to:'drivers#new',as:'resister_driver', via:'get'
  match '/book/:id',to:'books#show',as:'books_trip',via:'get'
  match '/approve/:id',to:'books#approve',as:'approve_book',via:'get'
  match '/disapprove/:id',to:'books#disapprove',as:'disapprove_book',via:'get'
   # post "sample_pages/purchase"
   # url で表示したくない、容量 POST
  
  resources :users do
    member do
      get :sending, :receivings, :messages
      get 'book'
    end
  end

  resources :drivers do
    member do 
      get 'trip'
    end
  end

  resources :reviews
  resources :messages
  resources :trips do
    member do
      get 'book', :driver
    end
  end
end





# match '/notification',to: 'notification#index', via:'get'
  # match '/notification/:id',to: 'notification#show',as:'notification_smtg', via:'get'










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

