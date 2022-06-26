Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :partners, only: [:index, :show, :create] do
        get 'search', on: :collection, to: 'partners#search' 
      end      
    end
  end

end
