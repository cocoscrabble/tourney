Rails.application.routes.draw do
  resources :tournaments do
    resources :results
    resources :entrants
    post 'entrants/update_all', to: 'entrants#update_all'
  end
  resources :players
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
