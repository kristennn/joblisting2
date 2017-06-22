Rails.application.routes.draw do
  devise_for :users
  root "jobs#index"
  resources :jobs

  namespace :admin do
    resources :jobs do
      member do
        post :hide
        post :public
      end
    end
  end
end
