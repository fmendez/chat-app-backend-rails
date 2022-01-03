Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :messages, only: %i[index]
  resources :users, only: %i[index create] do
    post 'add_message'
    post 'change_status'
  end

  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  # root "articles#index"
end
