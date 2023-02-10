Rails.application.routes.draw do
  root to: redirect('/blogs')
  resources :blogs
end
