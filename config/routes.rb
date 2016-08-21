Rails.application.routes.draw do

  devise_for :players, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, module: "players"
  root to: "home#index"
  get '/tournaments' => "tournaments#main", as: "tournament_index"
  get '/tournaments/create' => "tournaments#index", as: "tournament_create"
  get '/tournaments/show' => "tournaments#show", as: "tournament_show_all"
  get '/tournaments/:id/init', :controller => 'tournaments', :action => 'init', as: "tournament_init"
  post '/tournaments/:id/start', :controller => 'tournaments', :action => 'start', as: "tournament_start"
  post '/tournaments/new', :controller => 'tournaments', :action => 'create', as: "tournament_new"
  get '/tournaments/:id/play' => "tournaments#play", as: "tournament_play"
  post '/tournaments/:id/play/match', :controller => 'tournaments', :action => 'match_finished'
  get '/tournaments/:id/finish' => "tournaments#finish", as: "tournament_summary"
  get '/tournaments/:id/play/final' => 'tournaments#final', as: "tournament_final_match"
  post '/tournaments/:id/final', :controller => 'tournaments', :action => 'final_match'
  post '/tournaments/:id/end', :controller => 'tournaments', :action => 'destroy', as: "tournament_destroy"
  get '/tournaments/:id/join' => "tournaments#join", as: "tournament_join"
  get '/tournaments/:id/owner_join' => "tournaments#owner_join", as: "tournament_owner_join"
  post '/tournaments/:id/join_owner', :controller => "tournaments", :action => "join_owner", as: "tournament_join_owner"
  post '/tournaments/:id/join', :controller => 'tournaments', :action => 'join_player', as: "tournament_join_player"
  get '/tournaments/:id/joined' => "tournaments#joined", as: "tournament_joined"
  get '/players/:id/history' => 'players#history', as: "player_history"
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
