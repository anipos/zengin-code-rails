# frozen_string_literal: true

module ZenginCodeRails
  class BanksController < ApplicationController # :nodoc:
    def index
      @banks = ZenginCode::Bank.all.values.sort_by(&:code)
    end
  end
end
