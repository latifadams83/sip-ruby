
Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users

  # resources :staff_categories, only: [:index, :create, :update, :delete, :destroy]
  # resources :staff_departments, only: [:index, :create, :update, :delete, :destroy]

    #School Resouces
    resource :school_infos, only: [:new, :show, :edit, :update, :create, :delete, :destroy], path_names: { new: 'add'}
    resources :gradelevels, :programmes, :classrooms, :periods, :badges

    #Staff Resources
    resources :staff_departments
    resources :staffs do
      member do
        get :contacts
        get :add_contact
        get :edit_contact
        put :update_contact
      end
      collection do
        get :manage
        # put :action
        # post :action
        # delete :action
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
