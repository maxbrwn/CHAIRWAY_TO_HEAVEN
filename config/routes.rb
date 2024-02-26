Rails.application.routes.draw do

  devise_for :users
  root to: "furnitures#index"
  resources :furnitures, except: :index

end
