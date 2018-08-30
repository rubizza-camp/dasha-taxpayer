require "administrate/base_dashboard"

class TaxationFormDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organization_form: Field::BelongsTo,
    activities: Field::HasMany,
    calculation_forms: Field::HasMany.with_options(class_name: "Taxes::CalculationForm"),
    constraints: Field::HasMany,
    declaration_period: Field::BelongsTo.with_options(class_name: "RecurrencePeriod"),
    payment_period: Field::BelongsTo.with_options(class_name: "RecurrencePeriod"),
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    declaration_period_id: Field::Number,
    payment_period_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :organization_form,
    :activities,
    :calculation_forms,
    :constraints,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :organization_form,
    :activities,
    :calculation_forms,
    :constraints,
    :declaration_period,
    :payment_period,
    :id,
    :name,
    :description,
    :created_at,
    :updated_at,
    :declaration_period_id,
    :payment_period_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :organization_form,
    :activities,
    :calculation_forms,
    :constraints,
    :declaration_period,
    :payment_period,
    :name,
    :description,
    :declaration_period_id,
    :payment_period_id,
  ].freeze

  # Overwrite this method to customize how taxation forms are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(taxation_form)
  #   "TaxationForm ##{taxation_form.id}"
  # end
end
