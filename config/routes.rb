Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users #6つのroutesが作成される
end
