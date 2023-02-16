Rails.application.routes.draw do
  devise_for :users
  resources :trips

  devise_scope :user do
    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
