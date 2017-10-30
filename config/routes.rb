Rails.application.routes.draw do

  resources :albums do
    resources :images, :only => [:create, :destroy] # support #create and #destroy
  end

  devise_for :users

  root to: "home#index"

end
