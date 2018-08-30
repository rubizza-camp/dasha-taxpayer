require "administrate/base_dashboard"

class RecurrencePeriodDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    taxation_form: Field::HasOne,
    id: Field::Number,
    type: Field::String,
    day_start: Field::Number,
    day_end: Field::Number,
    month_start: Field::Number,
    month_end: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :taxation_form,
    :id,
    :type,
    :day_start,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :taxation_form,
    :id,
    :type,
    :day_start,
    :day_end,
    :month_start,
    :month_end,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :taxation_form,
    :type,
    :day_start,
    :day_end,
    :month_start,
    :month_end,
  ].freeze

  # Overwrite this method to customize how recurrence periods are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(recurrence_period)
  #   "RecurrencePeriod ##{recurrence_period.id}"
  # end
end
