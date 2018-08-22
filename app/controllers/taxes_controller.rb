# frozen_string_literal: true

class TaxesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @taxes = wrapped_taxes.sort_by { |tax| tax.next_payment_period.last }
    @taxes_all = Tax.where(activity: current_user.activities)
  end

  private

  def wrapped_taxes
    current_user.activities.map do |activity|
      TaxesBuilderPresenter.new(activity)
    end
  end
end
