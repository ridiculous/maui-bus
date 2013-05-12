MauiBusRoutes::Application.routes.draw do
  resources :sources, only: [:index]
  match 'regions/:name', to: 'regions#show', as: 'show_region'
  match 'regions/:region_name/routes/:name/map', to: 'bus_routes#show_map', as: 'show_bus_map'
  match 'schedule', to: 'regions#schedule', as: 'schedule'
  root to: 'regions#index'
end
