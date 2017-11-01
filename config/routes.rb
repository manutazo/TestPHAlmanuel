Rails.application.routes.draw do


    resources :albums, except: :index do
    resources :images, :only => [:create, :destroy] # support #create and #destroy
  end


  devise_for :users

  get '/users/:id', to: 'users#show', as: 'profile'

  root to: "home#index"

end
