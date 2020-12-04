# frozen_string_literal: true

require "rails_helper"

RSpec.describe "branches api" do
  describe "index" do
    subject(:res) do
      get "/zengin_code_rails/banks/#{bank.code}/branches.json"
      response
    end

    context "with undefined bank code" do
      let(:bank) { OpenStruct.new(code: "imaginary-bank-code") }

      it "returns 404 not found when bank not found" do
        expect { res }.to raise_error(ActionController::RoutingError)
      end
    end

    ZenginCode::Bank.all.each_value do |bank|
      context "with bank #{bank.name}" do
        let(:bank) { bank }

        it "returns 200 ok" do
          expect(res).to have_http_status(:ok)
        end

        it "contains branches keys" do
          json = JSON.parse(res.body)
          expect(json).to include("branches")
        end

        it "returns all branches" do
          branches = JSON.parse(res.body)["branches"]
          expect(branches.size).to eq(bank.branches.size)
        end

        it "returns all branch attributes" do
          branch = JSON.parse(res.body)["branches"].sample
          expect(branch).to include("code", "name", "kana", "hira", "roma")
        end
      end
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
