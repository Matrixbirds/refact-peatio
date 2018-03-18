Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [] do
      collection do
        post 'sign_up'
        post 'sign_in'
        delete 'logout'
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
