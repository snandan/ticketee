Ticketee::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations" }

  get '/awaiting_confirmation', :to => "users#confirmation", :as => 'confirm_user'
  

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :states
  end

  put '/admin/users/:user_id/permissions',
        :to => 'admin/permissions#update',
        :as => :update_user_permissions

  resources :files

  resources :tickets do
    resources :comments
  end
end
