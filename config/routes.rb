Rails.application.routes.draw do

  resources :inspections
  #resource :users, only: [:create]
  post "/login", to: "users#login"
  post "/register" ,to: "users#register"
  get "/summary", to: "users#summary"
  get "/options", to:"users#farm_options"

  get "/owners",to: "owners#get_owners"
  post "/owners",to: "owners#add_owner"
  get "/owners/:id", to: "owners#get_owner_by_id"
  get "/owners/:id/farms", to: "owners#get_owner_farms"
  post "/owners/:id", to: "owners#update_owner"
  delete "/owners/:id", to: "owners#delete_owner"

  resources :farms




end