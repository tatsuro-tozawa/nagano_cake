Rails.application.routes.draw do

  root to: 'admins/homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :clients, only: [:index, :edit, :show, :update]
    resources :genres, only: [:new, :create, :edit, :update]
    resources :products, only: [:new, :create, :show, :index, :edit, :update]
    resources :orders, only: [:index, :create, :show, :update]
    resources :order_details, only: [:index, :create, :show, :update]
  end

  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations'
  }

  namespace :clients do
    get 'homes/top' => 'homes#top', as:'top'
    get 'homes/about' => 'homes#about', as:'about'

    get 'mypage/edit' => 'edit'
    patch 'mypage' => 'mypage#update'
    get 'mypage/show' => 'show'
    get 'mypage/withdraw' => 'withdraw'
    patch 'mypage/withdraw_status' => 'mypage#withdraw_status'
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    resources :genres, only: [:show]
    resources :products, only: [:index, :show]
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:new, :index, :create, :show]
    resources :order_details, only: [:index, :create, :new]

    resources :cart_products, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
