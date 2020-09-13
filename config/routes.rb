Rails.application.routes.draw do

  root to: 'homes#top'

  devise_for :admins

  namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :genres, only: [:new, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
