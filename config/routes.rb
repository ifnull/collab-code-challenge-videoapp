Rails.application.routes.draw do
  root 'welcome#index'
  resources :videos, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :playlists, only: [:create, :show] do
    member do
      post 'add_video'
      delete 'remove_video'
    end
  end
end
