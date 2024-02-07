Rails.application.routes.draw do
  namespace :auth do
    namespace :v1 do
      resources :users, param: :_username
      post '/login', to: 'authentication#login'
      post '/register', to: 'authentication#register'
    end
  end

  get '/*a', to: 'application#not_found'
end
