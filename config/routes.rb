Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root  "user#home"

  resources :posts 

  get '/my-post', to: "posts#my_post"
 

  get "/signup", to: "user#new"
  get "/login", to: "user#login"
  post "/login", to: "user#loginsubmit"
  delete 'logout', to: 'user#logout'


  resources :user , except: [:new]
  resources :category

end
