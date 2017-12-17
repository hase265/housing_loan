Rails.application.routes.draw do
  root 'top#index'
  resources :calculations, only: [:index] do
    collection do
      post 'result'
    end
  end
end
