Rails.application.routes.draw do
  resources :albums
  root to: redirect('/bands')
  
  resources :bands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
