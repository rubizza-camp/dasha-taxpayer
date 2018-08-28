# frozen_string_literal: true

class OrganizationTasksService
  def self.generate_tasks(activity)
    tomorrow_date = Date.tomorrow
    activity.organization_form.steps.each do |step|
      Tasks::OrgRegistration.create(activity:    activity,
                                    description: step.description,
                                    date:        tomorrow_date,
                                    period:      tomorrow_date..tomorrow_date)
    end
  end
end
