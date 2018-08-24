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
    org_forms_by_workers_number
    taxation_form = taxation_forms_filter.first
    {activity_type: activity_type, taxation_form: taxation_form, organization_form: taxation_form.organization_form}
  end

  private

  def activity_type
    @activity_type ||= ActivityType.find_by(id: params.delete(:activity_type_id))
  end

  def organization_forms
    @organization_forms ||= activity_type.organization_forms.to_a
  end

  def org_forms_by_workers_number
    organization_forms.delete_if do |org_form|
      !Constraints::WorkersNumber.find_by(organization_form: org_form).appropriate?(params[:workers_number].to_i)
    end
  end

  def taxation_forms_filter
    organization_forms.map(&:taxation_forms).flatten.reject do |tax_form|
      check_taxation_form(tax_form).include? false
    end
  end

  def check_taxation_form(tax_form)
    tax_form.constraints.map do |constraint|
      constraint.appropriate_by_params?(params)
    end
  end
end
