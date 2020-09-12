Rails.application.routes.draw do

  root to: 'homes#top'

  namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
