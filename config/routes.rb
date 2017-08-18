Rails.application.routes.draw do
  resources :projects
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  resources :blogs
end
