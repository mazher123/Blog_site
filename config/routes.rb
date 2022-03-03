Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root  "users#home"

  resources :posts 

  get '/my-post', to: "posts#my_post"
  get "/signup", to: "users#new" , as: 'signup'
  post "/signup", to: "users#create" , as: 'user_create'
  get "/login", to: "users#login" ,  as: 'login'
  post "/login", to: "users#loginsubmit" ,as: 'login_submit'
  get '/logout', to: 'users#logout' ,as: 'logout'
  # resources :users , except: [:new]
  resources :categories

end
