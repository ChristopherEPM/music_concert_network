Rails.application.routes.draw do
  resources :concerts, only: [:show, :create, :new, :index] do
    resources :comments, only: [:show, :create, :new]

  end

end
