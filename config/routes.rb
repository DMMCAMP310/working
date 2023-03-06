Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root :to => 'homes#top'
  resource :users, only: [:edit, :update] do
    collection do
      get "cart", :to => "shopping_carts#index"
      post "cart/create", :to => "shopping_carts#create"
      delete "cart", :to => "shopping_carts#destroy"
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
      get "mypage/edit_password", :to =>"users#edit_password"
      put "mypage/password", :to => "users#update_password"
      get  "mypage/favorite", :to => "users#favorite"
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
