Rails.application.routes.draw do
  resources :projects do
    resources :project_partials, only: [:index, :new, :create]
    end
  resources :project_partials, only: [:show, :edit, :update, :destroy] do
    resources :mep_audios, only: [:index, :new, :create]
  end
  resources :mep_audios, only: [:show, :edit, :update, :destroy]
  root 'projects#index'
end