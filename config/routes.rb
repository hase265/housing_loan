Rails.application.routes.draw do
  root 'top#index'
  resources :calculations, only: [:index, :create] do
    collection do
      get '/result', to: 'calculations#calculate'
    end
  end
end
