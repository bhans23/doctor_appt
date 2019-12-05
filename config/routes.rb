Rails.application.routes.draw do
  resources  :patients
  resources :doctors do
    resources :appointments
  end

end
