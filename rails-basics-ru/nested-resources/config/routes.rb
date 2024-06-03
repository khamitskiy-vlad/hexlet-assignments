# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[index new create]
    end
  end

  resources :posts, shallow: true do
    scope module: :posts do
      resources :comments, only: %i[show edit update destroy]
    end
  end
  # END
end
