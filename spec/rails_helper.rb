# frozen_string_literal: true

require "spec_helper"

ENV["RAILS_ENV"] ||= "test"

require_relative "./dummy/config/environment"

require "rspec/rails"

RSpec.configure(&:infer_spec_type_from_file_location!)
