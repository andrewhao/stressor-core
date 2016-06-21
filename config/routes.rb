VelocitasCore::Application.routes.draw do
  resources :tracks

  scope module: :commuting do
    resources :commutes
    resources :stoplights, only: [:index, :show]
  end

  root to: 'commuting/stoplights#index'
  mount Commuting::ActivitiesAPI => '/api'
  mount Commuting::StoplightAPI => '/api'
  mount VelocitasCore::TracksAPI => '/api'
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
end
