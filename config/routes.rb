Rails.application.routes.draw do
    root to: 'population_growth#index'

    get '/search' => 'population_growth#search'
end
