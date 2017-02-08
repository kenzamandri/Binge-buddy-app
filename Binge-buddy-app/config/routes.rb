Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "welcome#home", as: "home_page"


  resources :users
  # get "/movies/guideboxwrapper"  => "movies#guideboxwrapper"


  get "/movies/search" => "movies#search_form", as: "movie_search"

  post "/movies/search-results"       => "movies#search_results"
  get "/movies/search-results"       => "movies#search_results"
  post "/movies/one_result"      => "movies#one_result"

  get "/movies/one_result"      => "movies#one_result", as: "one_result"

  resources :movies






end
