Rails.application.routes.draw do
  # get 'articles', to: 'articles#index'
  resources :articles, only: [:index, :show]
  # root "articles#index"
end
