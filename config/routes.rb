Rails.application.routes.draw do
  post '/outbound', to: 'outbound#create'
  post '/inbound', to: 'inbound#create'
end
