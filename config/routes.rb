Rails.application.routes.draw do
  root to: 'home#index'
  post '/check_post_code', to: 'home#check_post_code'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
