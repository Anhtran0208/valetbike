Rails.application.routes.draw do
  devise_for :users
  root "home_page#index"

  # stripe listen --forward-to localhost:4242/stripe/webhooks
  post 'stripe/webhooks', to: 'stripe/webhooks#create'
  get 'membership', to: 'stripe/checkout#pricing'
  post 'stripe/checkout', to: 'stripe/checkout#checkout'
  get 'stripe/checkout/success', to: 'stripe/checkout#success'
  get 'stripe/checkout/cancel', to: 'stripe/checkout#cancel'
  post 'stripe/billing_portal', to: 'stripe/billing_portal#create'

  get 'past_trips/index'
  get 'active_trip/index'
  get 'active_trip/return'
  get 'return', to: 'active_trip#return'
  get 'payment_information/index'
  get 'account/index'
  # get 'membership', to: 'home_page#membership'
  get 'howitworks', to: 'home_page#howitworks'
  get 'about', to: 'home_page#about'
  get 'contactus', to: 'home_page#contactus'
  get 'base_map', to: 'active_trip#base_map'
  get 'rent_map', to: 'active_trip#rent_map'
  get 'return_map', to: 'active_trip#return_map'
  get "/stations/:id", to: "stations#show", as: :station
  get "/bikes", to: "bikes#index"
  get "/bikes/:id", to: "bikes#show", as: :bike

  get"/stations", to: "stations#index"
end

