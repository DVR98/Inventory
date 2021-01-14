Rails.application.routes.draw do
  get 'items_imports/new'

  get 'items_imports/create'

  resources :items

  Rails.application.routes.draw do
  get 'items_imports/new'

  get 'items_imports/create'

    resources :items
    resources :items_imports, only: [:new, :create]
  
    root to: 'items#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
