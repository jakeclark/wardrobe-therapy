Rails.application.routes.draw do
  resources :books

  resources :events

  resources :categories

  resources :lookbooks

  resources :user_details

  get 'welcome/show'

  #devise_for :users

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  #devise_for :users, :controllers => { :registrations => "registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#show'

  get 'welcome/stylist_home' => 'welcome#stylist_home'
  get 'welcome/client_home' => 'welcome#client_home'

  get 'user_details/edit' => 'user_details#edit'

  get 'user_details/show' => 'user_details#show'

  get 'user_details/update' => 'user_details#update'

  get 'user_details/index' => 'user_details#index'

  get 'lookbooks/new' => 'lookbooks#new'

  get 'lookbooks/index' => 'lookbooks#index'

  get 'books/index' => 'books#index'

  resources :follows do
    member do
      get :follow
      get :unfollow
      get :list_clients
      get :list_stylists
    end
  end


  #get 'devise/registrations/new' => 'welcome#new'

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
