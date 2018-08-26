# frozen_string_literal: true

class StatementLoadersController < ApplicationController
  def new
    @organization = Organization.find(params[:id])
  end

  def show; end

  def extract_tax
    activities = Organization.find(params[:id]).activities
    @data_statement = BankStatementCalculateService.calculate(activities, params[:my_file].tempfile)
    flash.now[:notice] = 'Statement successfully loaded and processed'
    render :show, data: @data_statement
  rescue StandardError
    redirect_to extract_new_path, alert: 'Ошибка. Попробуйте загрузить еще раз'
  end
end
