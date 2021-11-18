Rails.application.routes.draw do
  root 'welcome#index'

  delete 'del_rec', to: 'welcome#destroy'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  get 'password', to: 'password#edit', as: 'edit_password'
  patch 'password', to: 'password#update'
  get 'password/reset', to: 'password_reset#new'
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'

  get 'profile', to: 'profile#index'
  delete 'account', to: 'profile#destroy', as: 'del_acc'

  get 'booking', to: 'bookings#new'
  post 'booking', to: 'bookings#create'

  get 'reservations', to: 'reservations#index'
  get 'confirm', to: 'reservations#confirm'
  post 'del_rsrv', to: 'reservations#destroy'
end
