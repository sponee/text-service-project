Rails.application.routes.draw do
  root to: 'text_messages#index'
  post '/outbound', to: 'outbound#create'
  post '/inbound', to: 'inbound#create'
end
