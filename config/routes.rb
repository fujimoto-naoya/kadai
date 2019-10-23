Rails.application.routes.draw do
  resources :items do
    collection do
      get 'json'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
