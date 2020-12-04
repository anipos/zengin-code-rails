# frozen_string_literal: true

require "rails_helper"

RSpec.describe ZenginCode::Bank do
  it "cache keys must be unique" do
    cache_keys = Set.new

    described_class.all.each_value do |bank|
      key = bank.cache_key
      raise "#{key} is not unique" unless cache_keys.add?(key)
    end
  end
end
