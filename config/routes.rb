Rails.application.routes.draw do
  #resource :users, only: [:create]
  post "/login", to: "users#login"
  post "/register" ,to: "users#register"
  get "/summary", to: "users#summary"
end