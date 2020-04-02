Rails.application.routes.draw do
 
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :buyers, controllers: {
    sessions: 'buyers/sessions'
  }

  root to: "dashboard#index" 

  namespace :admins do
    resources :dashboard, only: [:index] do
      collection do
        post 'import_csv'
        get 'inquiry'
        get 'channel'
        post 'message'
      end
    end
  end

  resources :dashboard do
    collection do
      get 'inquiry'
      post 'message'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
