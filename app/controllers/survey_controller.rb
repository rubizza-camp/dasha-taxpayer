# frozen_string_literal: true

class SurveyController < ApplicationController
  def new
  end

  def create
    SurveyProcessingService.call(survey_params)
  end

  private

  def survey_params
    params.permit(:activity_type_id, :workers_number, :work_abroad, :profit)
  end
end

