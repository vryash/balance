Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :create] do
    resources :invoices do
      collection do
        get :summary
      end
    end
  end
end
