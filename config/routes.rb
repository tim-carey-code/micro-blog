Rails.application.routes.draw do
  resources :blogs
  root to: "blogs#index"
  devise_for :users
end
