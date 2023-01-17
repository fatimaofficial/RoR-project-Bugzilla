Rails.application.routes.draw do

  get 'home/dashboard'
  
  devise_for :users
  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
  resources :users
  resources :projects do
    member do
      get 'project_details'
      post 'assign_project'
    end
    resources :bugs do
      member do
        get 'assign_bug'
      end
    end
    resource :project_assignments
  end

  root "projects#index" 

end
