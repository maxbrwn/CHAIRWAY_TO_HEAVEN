Rails.application.routes.draw do

  root to: "furnitures#index"
  resources :furnitures, except: :index

end
