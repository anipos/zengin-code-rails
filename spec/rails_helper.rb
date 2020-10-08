# frozen_string_literal: true

require "spec_helper"

ENV["RAILS_ENV"] ||= "test"

require_relative "./dummy/config/environment"

require "rspec/rails"

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.around(:each, :perform_caching) do |example|
    cache_store = ActionController::Base.cache_store
    ActionController::Base.cache_store = ActiveSupport::Cache::MemoryStore.new
    ActionController::Base.perform_caching = true

    example.run

    ActionController::Base.perform_caching = false
    ActionController::Base.cache_store = cache_store
  end
end
