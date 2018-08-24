# frozen_string_literal: true

class TaxesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @taxes = wrapped_taxes.sort_by { |tax| tax.next_payment_period.last }
  end

  private

  def wrapped_taxes
    current_user.activities.includes(:organization, taxation_form: %i[declaration_period payment_period]).map do |activity|
      TaxesBuilderPresenter.new(activity)
    end
  end
end
