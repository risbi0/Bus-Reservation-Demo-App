Rails.application.routes.draw do
  root 'welcome#index'

  delete 'del_rec', to: 'welcome#destroy'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  get 'booking', to: 'bookings#new'
  post 'booking', to: 'bookings#create'

  get 'reservations', to: 'reservations#index'
  get 'confirm', to: 'reservations#confirm'
  post 'del_rsrv', to: 'reservations#destroy'
end
