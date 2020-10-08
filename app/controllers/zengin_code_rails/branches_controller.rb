# frozen_string_literal: true

module ZenginCodeRails
  class BranchesController < ApplicationController # :nodoc:
    def index
      @branches = bank.branches.values.sort_by(&:code)
    end

    private

    def bank
      bank = ZenginCode::Bank[params[:bank_id]]
      raise ActionController::RoutingError, "unknown bank code" unless bank

      bank
    end
  end
end
