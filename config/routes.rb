Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  post '/outbound', to: 'outbound#create'
  post '/inbound', to: 'inbound#create'
end
