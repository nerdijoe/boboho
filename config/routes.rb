Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'

  resources :users do
    resources :listings do
      get 'chat' => 'users#chat'
    end
    get 'chat' => 'users#chat'

    # post 'tokens' => "tokens#create"
  end
  get 'edit_profile_pic' => 'users#edit_profile_pic', as: 'edit_profile_pic'

  resources :listings, only: [:show] do
    resources :likes, only: [:create]
    get 'chat' => 'users#chat'
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :categories, only: [:show]
  resources :subcategories, only: [:show]

  resources :searches, only: [:new, :create, :show]

  # Omniauth
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  post 'tokens' => "tokens#create"


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
