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
    @data_statement = GetTaxForOrganizationService.fetch(params[:id]).new(array_obj)
    render :show, data: @data_statement
  end
end
