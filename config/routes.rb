Rails.application.routes.draw do
  get 'ticket/issue'
  resources :widgets

  root 'welcome#index'

  # for LINE webhook
  post '/callback' => 'webhook#callback'
end
