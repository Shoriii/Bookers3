Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home#top'
   get '/home/about' => 'home#about'
   devise_for :users
   devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   end
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
end
