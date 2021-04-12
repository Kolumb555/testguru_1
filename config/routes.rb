Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sign_out: :logout }

  #delete :sessions, to: 'sessions#destroy'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :replies, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
