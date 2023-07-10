Rails.application.routes.draw do
  resources :measurements
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'led/on' => 'led#on'
  get 'led/off' => 'led#off'
  get 'heater/on' => 'heater#on'
  get 'heater/off' => 'heater#off'
  get 'lamp/toggle' => 'lamp#toggle'

  post 'hook/github' => 'hook_receiver#github'
end

## 