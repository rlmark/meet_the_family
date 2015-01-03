Rails.application.routes.draw do

  # Relations Join Table Routes
  get 'relations/index',    to: 'relations#index',  as: :relations
  get 'relations/new',      to: 'relations#new',    as: :new_relation
  post 'relations/create',  to: 'relations#create'
  get 'relations/:id',      to: 'relations#show',   as: :relation
  patch 'relations/:id',    to: 'relations#update'
  delete 'relations/:id',   to: 'relations#destroy'
  get 'relations/:id/edit', to: 'relations#edit',   as: :edit_relation

  # Relatives Routes
  get 'relatives',      to: 'relatives#index',    as: :relatives
  get 'relatives/new',  to: 'relatives#new',      as: :new_relative
  post 'relatives',     to: 'relatives#create'
  get 'relatives/:id',   to: 'relatives#show',    as: :relative
  patch 'relatives', to: 'relatives#update',  as: :update_relative
  delete 'relatives/:id', to: 'relatives#destroy'
  get 'relatives/:id/edit', to: 'relatives#edit', as: :edit_relative

  # Decks Routes
  get 'decks',          to: 'decks#index',        as: :decks
  get 'decks/new',      to: 'decks#new',          as: :new_deck
  post 'decks',         to: 'decks#create'
  get 'decks/:id',      to: 'decks#show',         as: :deck
  patch 'decks/:id',    to: 'decks#update'
  delete 'decks/:id',   to: 'decks#destroy'
  get 'decks/:id/edit', to: 'decks#edit',         as: :edit_deck

  # Session Routes
  post 'login',         to: 'sessions#create',    as: :login
  delete 'logout',      to: 'sessions#destroy',   as: :logout

  # Home Route
  get '/',              to: 'welcome#index',      as: :root

  # User Routes
  get 'users',          to: 'users#index',        as: :users
  get 'users/new',      to: 'users#new',          as: :new_user
  post 'users',         to: 'users#create'
  get 'user/:id',       to: 'users#show',         as: :user
  patch 'user/:id',     to: 'users#update'
  delete 'user/:id',    to: 'users#destroy'
  get 'user/:id/edit',  to: 'users#edit',         as: :edit_user

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
