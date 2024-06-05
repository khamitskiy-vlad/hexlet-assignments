# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  locales = I18n.available_locales.join('|')
  scope '/(:locale)', locale: /#{locales}/ do
    root to: 'home#index'

    resources :posts do
      scope module: :posts do
        resources :comments, path: 'post_comments'
      end
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
