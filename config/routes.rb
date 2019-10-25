Rails.application.routes.draw do
  post '/outbound', to: 'outbound#create'
end
