Rails.application.routes.draw do
  get 'plays/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match 'games/store_images' => 'games#store_images', via: %i[get post]
  post 'plays/create', to: 'plays#create'
  root to: 'games#index'
end
