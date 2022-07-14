Rails.application.routes.draw do
  root to: "blogs#index"

  resources :blogs do
    resources :comments
  end

  devise_for :users
end
