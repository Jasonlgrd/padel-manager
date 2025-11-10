Rails.application.routes.draw do
  resources :players
  resources :matches

  root "players#index"
end
