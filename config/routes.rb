Rails.application.routes.draw do
  devise_for :users
  root "jobs#index"
  resources :jobs do
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      resources :resumes
      member do
        post :hide
        post :public
      end
    end
  end
end
