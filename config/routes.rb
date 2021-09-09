Rails.application.routes.draw do
  get 'user/list'
  get 'ticket/analyze'
  get 'ticket/list'
  get 'ticket/issue'
  resources :widgets

  root 'welcome#index'

  # for LINE webhook
  post '/callback' => 'webhook#callback'
end
