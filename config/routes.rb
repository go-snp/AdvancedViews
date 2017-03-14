Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs, only: %i(index new create show destroy update edit)
end
