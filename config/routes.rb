Rails.application.routes.draw do
  
  root 'chatroom#index'
  get 'login', to: 'session#new'

end
