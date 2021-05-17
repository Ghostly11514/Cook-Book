Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html+

  root 'recipes#index', as: 'home'
  # get 'new' => 'recipes#new'
  # get  '/recipes/:id' => 'recipes#show'
  # post 'new_recipe' => 'recipes#create'

  resources :recipes
end
