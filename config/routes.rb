Rails.application.routes.draw do

  root to: 'clients/homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :genres, only: [:new, :create, :edit, :update]
    resources :products, only: [:new, :create, :show, :index, :edit, :update]
  end

  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations'
  }

  namespace :clients do
    get 'homes/top' => 'homes#top', as:'client_top'
    get 'homes/about' => 'homes#about', as:'client_about'

    get 'mypage/edit' => 'edit'
    get 'mypage/show' => 'show'
    get 'withdraw'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
