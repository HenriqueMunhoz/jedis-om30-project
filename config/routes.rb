Rails.application.routes.draw do
  resources :municipes do
    resources :addresses
  end
end
