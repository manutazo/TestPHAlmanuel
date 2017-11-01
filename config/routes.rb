Rails.application.routes.draw do

  get '/users/:id', to: 'users#show', as: 'profile'

    resources :albums, except: :index do
    resources :images, :only => [:create, :destroy] # support #create and #destroy
  end


  devise_for :users

  root to: "home#index"

end
