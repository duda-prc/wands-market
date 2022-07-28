Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wands, shallow: true do
    resources :shopping_items, only: %i[create destroy update]
  end

  get '/mywands', to: 'wands#mywands', as: 'my_wands'

  resources :shopping_carts, only: %i[index]

  root to: 'pages#home'
end
