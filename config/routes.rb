Rails.application.routes.draw do

  devise_for :users
  root to: "furnitures#index"
  resources :furnitures, except: [:index] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings do
    member do
      patch :accept
      patch :reject
    end
  end
  get "/profile", to: "bookings#profile"

end
