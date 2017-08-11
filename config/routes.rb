Rails.application.routes.draw do
  resources :works
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  resources :blogs
end
