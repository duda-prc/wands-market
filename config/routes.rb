Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wands, shallow: true do
    resources :shopping_item, only: %i[create destroy update]
  end

  root to: 'pages#home'
end
