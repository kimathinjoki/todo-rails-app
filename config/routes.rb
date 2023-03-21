Rails.application.routes.draw do
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: "todos#todos"
  post '/create', to: "todos#create"
  patch '/update/:id', to: "todos#update"

  delete '/destroy/:id', to: "todos#destroy"


  post '/login', to: "users#login"

end
