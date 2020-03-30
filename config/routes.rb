# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'businesses#index'

  resources :businesses, only: [:show]
  resources :pages, param: :slug, only: [:show]
end
