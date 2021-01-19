Rails.application.routes.draw do
  resources :competition do
    resources :team
    resources :season_schedule
    resources :player
  end
end
