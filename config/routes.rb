Rails.application.routes.draw do
  root 'welcome#index'

  get 'add_schedule', to: 'welcome#new'
  post 'add_schedule', to: 'welcome#create'
  get 'schedule_bookings', to: 'welcome#show'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  get 'edit_password', to: 'password#edit'
  patch 'edit_password', to: 'password#update'

  get 'profile', to: 'profile#index'
  delete 'account', to: 'profile#destroy', as: 'del_acc'

  get 'booking', to: 'bookings#new'
  post 'booking', to: 'bookings#create'

  get 'reservations', to: 'reservations#index'
  get 'confirm', to: 'reservations#confirm'
  post 'confirm_reservation', to: 'reservations#update'
  post 'delete_reservation', to: 'reservations#destroy'
  get 'select_seats', to: 'reservations#choose'
  post 'select_seats', to: 'reservations#seats'
end
