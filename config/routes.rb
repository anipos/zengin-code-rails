# frozen_string_literal: true

ZenginCodeRails::Engine.routes.draw do
  resources :banks, only: %i[index]
end
