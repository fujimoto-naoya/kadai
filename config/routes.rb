Rails.application.routes.draw do


  root :to => "oauth_test#index"


  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }



  get 'oauth_test/show' => 'oauth_test#show'


  get 'oauth_test/error' => 'oauth_test#error'




end
