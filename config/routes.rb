Rails.application.routes.draw do
  resources :periods
  resources :classrooms
  resources :badges
  root 'dashboard#index'
  devise_for :users

  # resources :staff_categories, only: [:index, :create, :update, :delete, :destroy]
  # resources :staff_departments, only: [:index, :create, :update, :delete, :destroy]

    resource :school_infos, only: [:new, :show, :edit, :update, :create, :delete, :destroy], path_names: { new: 'add'}
      resources :gradelevels
    resources :programmes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
