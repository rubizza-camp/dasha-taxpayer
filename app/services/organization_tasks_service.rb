# frozen_string_literal: true

class OrganizationTasksService
  def generate_tasks(activity)
    activity.organization_form.steps.each do |step|
      Tasks::OrgRegistration.create(activity: activity,
                                    description: step.description,
                                    date: Date.tomorrow,
                                    period: Date.tomorrow..Date.tomorrow)
    end
  end
end
