Rails.application.routes.draw do
  # モデルを消したため、createを削除
  root 'top#index'
  resources :calculations, only: [:index] do
    collection do
      post 'result'
    end
  end
end
