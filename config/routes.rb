Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :quizzes, only: [:new, :create, :show, :edit, :update] do
    resources :questions, only: [:new, :create]
  end

  resource :session_request, only: [:new, :create, :destroy]

  # This is a GET because it comes from an email.
  get '/session/:token' => 'session#create', as: :create_session
  delete '/session' => 'session#destroy', as: :session

  root 'dashboard#show'
end
