Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :banks
  resources :branches
  resources :employees
  resources :customers
  resources :accounts
  resources :loans
  resources :atms
  resources :transactions
  delete '/banks/delete_all', to: 'banks#delete_all'
end
