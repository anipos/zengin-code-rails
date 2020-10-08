# frozen_string_literal: true

ZenginCodeRails::Engine.routes.draw do
  resources :banks, only: %i[index] do
    resources :branches, only: %i[index]
  end
end
