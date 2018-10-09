Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :banks

  delete '/banks/delete_all', to: 'banks#delete_all'
end
