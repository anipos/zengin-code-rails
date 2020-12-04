# frozen_string_literal: true

require "rails_helper"

RSpec.describe ZenginCode::Branch do
  it "cache keys must be unique" do
    cache_keys = Set.new

    ZenginCode::Bank.all.each_value do |bank|
      bank.branches.each_value do |branch|
        key = branch.cache_key
        raise "#{key} is not unique" unless cache_keys.add?(key)
      end
    end
  end
end
