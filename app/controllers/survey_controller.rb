# frozen_string_literal: true

class SurveyController < ApplicationController
  def new; end

  def create
    activity_params = SurveyProcessingService.call(survey_params)
    if activity_params
      activity = Activity.create(activity_params.merge(user: current_user))
      OrganizationTasksService.generate_tasks(activity)
      redirect_to tasks_path
    else
      redirect_to new_survey_path, alert: 'Sorry you cannot open the desired organization'
    end
  end

  private

  def survey_params
    params.permit(:activity_type_id, :workers_number, :work_abroad, :profit)
  end
end
