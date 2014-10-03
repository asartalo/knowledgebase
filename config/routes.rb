Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :slack_response, only: [:create]

end
