Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: redirect('/admin')
  post '/outbound', to: 'outbound#create'
  post '/inbound', to: 'inbound#create'
end
