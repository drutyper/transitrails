Rails.application.routes.draw do
 resources :stations, only: [:index, :show]

 root 'stations#index'
end
