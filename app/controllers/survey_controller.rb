# frozen_string_literal: true

class SurveyController < ApplicationController
  def new; end

  def create
    activity_params = SurveyProcessingService.call(survey_params)
    Activity.create(activity_params.merge(user: current_user))
  end

  private

  def survey_params
    params.permit(:activity_type_id, :workers_number, :work_abroad, :profit)
  end
end
