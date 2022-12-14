Rails.application.routes.draw do
  resources :users
  root to: redirect('/bands')
  
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:show, :create, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
