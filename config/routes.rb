Rails.application.routes.draw do
  resources :posts
  get '/posts/index/:search&:post_type' => 'posts#index'
  get '/posts/toggle/:post_id' => 'posts#toggle'
  get '/posts/:id&:post_type' => 'posts#show'




  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
