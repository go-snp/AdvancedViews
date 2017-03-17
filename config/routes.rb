Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs, only: %i(index new create show edit update destroy) do
    resources :entries, only: %i(new create show edit update destroy) do
      resources :comments, only: %i(create destroy) do
        patch 'approve'
      end
    end
  end

end
