Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :items
    resources :users, only:[:index, :show]
    resources :profiles
    resources :assigns, only:[:index, :create, :show, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
