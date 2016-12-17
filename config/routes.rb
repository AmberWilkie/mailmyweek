Rails.application.routes.draw do
  get '/google_calendar', to: 'google_calendar#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'main/index'

  root to: "main#index"
end
