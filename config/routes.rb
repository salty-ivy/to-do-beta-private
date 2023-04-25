Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # projects routes
  # ordering between new and show matters in this routing
  resources :projects, except: :index do
    resources :sections
  end


resources :sections, except: :index do
  resources :tasks, only: [:new, :create]
end

resources :tasks, only: [:show, :edit, :update, :destroy]

end
