MauiBusRoutes::Application.routes.draw do
  resources :sources, only: [:index]
  get 'regions/:name', to: 'regions#show', as: 'show_region'
  get 'regions/:region_name/routes/:name/map', to: 'bus_routes#show_map', as: 'show_bus_map'
  get 'schedule', to: 'regions#schedule', as: 'schedule'
  get 'bus/schedules', to: 'regions#schedule'
  get 'search', to: 'search#index', as: 'search'
  root to: 'regions#index'
end
