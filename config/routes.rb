Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root :to => 'homes#top'
  resource :users, only: [:edit, :update] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
    end
  end
  
  resources :timelogs, only: [:index, :create, :edit, :update]
  resources :products do
    member do
      get :favorite
    end
    resources :reviews, only: [:create]
  end
end
