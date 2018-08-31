# frozen_string_literal: true

class TaxesAndTasksGenerator
  def self.call
    activities = Activity.all
    activities.each do |activity|
      TaxesAndTasksGenerator.new(activity).generate
    end
  end

  attr_reader :activity

  def initialize(activity)
    @activity = activity
  end

  def generate
    create_tax_and_tasks if need_to_generate?
  end

  private

  def need_to_generate?
    last_tax = activity.taxes.last
    if last_tax
      last_tax.payment_period.last != payment_period.last
    else
      true
    end
  end

  def create_tax_and_tasks
    tax = Tax.create(activity:           activity,
                     declaration_period: declaration_period,
                     payment_period:     payment_period)
    Tasks::Declaration.create(activity: activity,
                              tax:      tax,
                              period:   declaration_period,
                              date:     declaration_period.first)
    Tasks::Payment.create(activity: activity,
                          tax:      tax,
                          period:   payment_period,
                          date:     payment_period.first)
  end

  def payment_period
    @payment_period ||= activity.taxation_form.declaration_period.next_period
  end

  def declaration_period
    @declaration_period ||= activity.taxation_form.declaration_period.next_period
  end
end
