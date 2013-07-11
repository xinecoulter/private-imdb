Moviez::Application.routes.draw do
  root :to => 'welcome#index'
  get '/movies/search' => 'movies#search', as: 'movies_search'
  get '/movies/new/search' => 'movies#new_search', as: 'new_movies_search'
  post '/movies' => 'movies#create', as: 'add_new_movie'
  post '/movies/:id' => 'movies#edit', as: 'edit_movie'
  resources :movies
  resources :actors

#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy
end
