Rails.application.routes.draw do
  resources :test_passages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :replies, shallow: true
    end
  end

end
