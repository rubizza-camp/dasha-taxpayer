# frozen_string_literal: true

class StatementLoadersController < ApplicationController
  def new
    @organization = Organization.find(params[:id])
  end

  def show; end

  def extract_tax
    tax = Activity.find(params[:id]).taxation_form
    @data_statement = BankStatementCalculateService.calculate(tax, params[:my_file].tempfile)
    render :show, data: @data_statement
  rescue StandardError
    redirect_to extract_new_path, alert: 'Ошибка. Попробуйте загрузить еще раз'
  end
end
