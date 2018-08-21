# frozen_string_literal: true

class SurveyProcessingService
  def self.call(params)
    new(params).call
  end

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    activity_type = ActivityType.find_by(id: params[:activity_type_id])
  end
end
