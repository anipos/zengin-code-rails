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
      expect {
        get "/zengin_code_rails/banks/imaginary-bank-code/branches.json"
      }.to raise_error(ActionController::RoutingError)
    end

    it "contains branches keys" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      json = JSON.parse(response.body)
      expect(json).to include("branches")
    end

    it "returns all branches" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      branches = JSON.parse(response.body)["branches"]
      expect(branches.size).to eq(bank.branches.size)
    end

    it "returns all branch attributes" do
      bank = ZenginCode::Bank.all.values.sample
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"

      branch = JSON.parse(response.body)["branches"].sample
      expect(branch).to include("code", "name", "kana", "hira", "roma")
    end
  end
end
