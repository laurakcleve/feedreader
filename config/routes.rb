Rails.application.routes.draw do

  root 'feeds#index'

  resources :feeds do
    member do
      resources :entries, only: [:index, :show]
    end
  end

end
