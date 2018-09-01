require "administrate/base_dashboard"

class TaskDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    activity: Field::BelongsTo,
    id: Field::Number,
    type: Field::String,
    period: Field::String.with_options(searchable: false),
    date: Field::DateTime,
    description: Field::String,
    status: Field::String,
    tax_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    step_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :activity,
    :id,
    :type,
    :period,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :activity,
    :id,
    :type,
    :period,
    :date,
    :description,
    :status,
    :tax_id,
    :created_at,
    :updated_at,
    :step_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :activity,
    :type,
    :period,
    :date,
    :description,
    :status,
    :tax_id,
    :step_id,
  ].freeze

  # Overwrite this method to customize how tasks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(task)
  #   "Task ##{task.id}"
  # end
end
