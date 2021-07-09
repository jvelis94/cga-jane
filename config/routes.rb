Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  devise_scope :user do
    authenticated :user do
      root 'talents#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :talents
end
