# frozen_string_literal: true

require "rails_helper"

RSpec.describe "banks api" do
  describe "index" do
    it "returns 200 ok" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      expect(response).to have_http_status(:ok)
    end

    it "returns 404 not found when bank not found" do
      get "/zengin_code_rails/banks/imaginary-bank-code/branches.json"

      expect(response).to have_http_status(:not_found)
    end

    it "contains branches keys" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      json = response.parsed_body
      expect(json).to include("branches")
    end

    it "returns all branches" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      branches = response.parsed_body["branches"]
      expect(branches.size).to eq(bank.branches.size)
    end

    it "returns all branch attributes" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      branch = response.parsed_body["branches"].sample
      expect(branch).to include("code", "name", "kana", "hira", "roma")
    end

    it "caches view fragments", :perform_caching do
      allow(Rails.cache).to receive(:write).and_call_original

      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      expect(Rails.cache).
        to have_received(:write).exactly(bank.branches.size + 1).times
    end
  end
end
