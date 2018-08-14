# frozen_string_literal: true

class TaxesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @taxes = wrapped_taxes.sort_by(&:declaration_period_end)
  end

  private

  def wrapped_taxes
    current_user.organizations.map do |organization|
      TaxesBuilderPresenter.new(organization)
    end
  end
end
