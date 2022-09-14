# frozen_string_literal: true

require "rails_helper"

RSpec.describe ZenginCode::Branch do
  it "cache keys must be unique" do
    cache_keys = Set.new

    ZenginCode::Bank.all.each_value do |bank|
      bank.branches.each_value do |branch|
        key = branch.cache_key
        expect(cache_keys.add?(key)).not_to be_nil
      end
    end
  end
end
