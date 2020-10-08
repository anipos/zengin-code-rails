# frozen_string_literal: true

require "rails_helper"

RSpec.describe "banks api" do
  describe "index" do
    it "returns 200 ok" do
      get "/zengin_code_rails/banks.json"

      expect(response).to have_http_status(:ok)
    end

    it "contains banks key" do
      get "/zengin_code_rails/banks.json"
      json = JSON.parse(response.body)

      expect(json).to include("banks")
    end

    it "returns all banks" do
      get "/zengin_code_rails/banks.json"
      banks = JSON.parse(response.body)["banks"]

      expect(banks.size).to eq(ZenginCode::Bank.all.size)
    end

    it "returns all bank attributes" do
      get "/zengin_code_rails/banks.json"
      bank = JSON.parse(response.body)["banks"].sample

      expect(bank).to include("code", "name", "kana", "hira", "roma")
    end
  end
end
