Symphian::Application.routes.draw do
  root 'static_pages#home'
  
  resources :users
  resources :listings
  resources :instruments, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :openings, only: [:create, :destroy]
  resources :venues
  resources :groups do
    member do
      get :members
    end
  end
  resources :updates
  
  get 'search', to: 'search#show'
  
  match '/about',     to: 'static_pages#about', via: 'get'
  get '/signup',    to: 'users#new'
  match '/signin',    to: 'sessions#new',       via: 'get'
  match '/signin',    to: 'sessions#create',    via: 'post'
  match '/signout',   to: 'sessions#destroy',   via: 'delete'
  match '/settings',  to: 'users#settings',     via: 'get'

  match '/soundcloud/connect',    to: 'soundcloud#connect',     via: 'get'
  match '/soundcloud/connected',  to: 'soundcloud#connected',   via: 'get'
  match '/soundcloud/disconnect', to: 'soundcloud#disconnect',  via: 'get'
  
  
  # BIG TODO!! These auth functions should call into an auth controller
  #   with the idea being to seperate auth from session
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: redirect('/')

  match '/youtube', to: 'youtube#update', via: 'patch'

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/dash"
  
  get '/dash', to: "static_pages#dash"
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
end
