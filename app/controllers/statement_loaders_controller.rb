# frozen_string_literal: true

class StatementLoadersController < ApplicationController
  def new
    @organization = Organization.find(params[:id])
  end

  def show; end

  def extract_tax
    raise 'Exception Upload CSV' if params[:my_file].blank?
    csv       = CsvParserStatementService.new.parse(params[:my_file])
    array_obj = BgpbCsvHandlingService.new(csv).fetch
    @data_statement = select_type_tax(params[:id]).new(array_obj)
    render :show, data: @data_statement
  end

  def redirect_taxes
    redirect_to taxes_path
  end

  private

  def select_type_tax(organization_id)
    @organization = Organization.find(organization_id)
    case @organization.taxation_form.name
    when 'УСН'
      CalculateExtractForUsnService
    when 'Единый налог'
      CalculateExtractForSingleService
    end
  end
end
