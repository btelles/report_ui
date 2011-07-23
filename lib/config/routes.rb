Rails.application.routes.draw do
  resources :reports do
    get :columns
  end
end

