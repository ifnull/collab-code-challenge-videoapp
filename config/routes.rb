Rails.application.routes.draw do
  resources :videos, only: [:index]
  resources :playlists do
    member do
      post 'add_video'
      delete 'remove_video'
    end
  end
  root 'videos#index'
end
