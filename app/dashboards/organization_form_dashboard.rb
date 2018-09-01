require "administrate/base_dashboard"

class OrganizationFormDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organizations: Field::HasMany,
    taxation_forms: Field::HasMany,
    constraints: Field::HasMany,
    activity: Field::HasMany,
    steps: Field::HasMany,
    activity_types: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :organizations,
    :taxation_forms,
    :constraints,
    :activity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :organizations,
    :taxation_forms,
    :constraints,
    :activity,
    :steps,
    :activity_types,
    :id,
    :name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :organizations,
    :taxation_forms,
    :constraints,
    :activity,
    :steps,
    :activity_types,
    :name,
  ].freeze

  # Overwrite this method to customize how organization forms are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(organization_form)
  #   "OrganizationForm ##{organization_form.id}"
  # end
end
