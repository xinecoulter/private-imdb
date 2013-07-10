Moviez::Application.routes.draw do
  root :to => 'welcome#index'
  get '/movies/search' => 'movies#search', as: 'movies_search'
  resources :movies
#       root        /                          welcome#index
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy
end
