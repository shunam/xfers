Rails.application.routes.draw do
  get 'shop/index'
  get 'shop/purchase'
  get 'shop/success'
  get 'shop/balance_not_enough'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
