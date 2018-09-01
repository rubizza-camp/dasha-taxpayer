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
    result_params(taxation_form) if taxation_form
  end

  private

  def activity_type
    @activity_type ||= ActivityType.includes(:taxation_forms, organization_forms: :taxation_forms)
                                   .find_by(id: params.delete(:activity_type_id))
  end

  def organization_forms
    @organization_forms ||= activity_type.organization_forms.to_a
  end

  def org_forms_by_workers_number
    organization_forms.delete_if do |org_form|
      constraint = Constraints::WorkersNumber.find_by(organization_form: org_form)
      !constraint.appropriate?(params[:workers_number].to_i) if constraint
    end
  end

  def taxation_forms_filter
    taxation_forms = activity_type.taxation_forms && organization_forms.map(&:taxation_forms).flatten
    taxation_forms.reject do |tax_form|
      check_taxation_form(tax_form)
    end
  end

  def check_taxation_form(tax_form)
    tax_form.constraints.any? do |constraint|
      constraint.appropriate_by_params?(params) == false
    end
  end

  def result_params(taxation_form)
    {
      activity_type:     activity_type,
      taxation_form:     taxation_form,
      organization_form: taxation_form.organization_form
    }
  end
end
