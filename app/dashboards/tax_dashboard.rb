require "administrate/base_dashboard"

class TaxDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    activity: Field::BelongsTo,
    taxation_form: Field::HasOne,
    organization: Field::HasOne,
    declaration_task: Field::HasOne,
    payment_task: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    receipts: Field::Number.with_options(decimals: 2),
    exchange_difference: Field::Number.with_options(decimals: 2),
    gross_revenue: Field::Number.with_options(decimals: 2),
    sum_tax: Field::Number.with_options(decimals: 2),
    payment_period: Field::String.with_options(searchable: false),
    declaration_period: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :activity,
    :taxation_form,
    :organization,
    :declaration_task,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :activity,
    :taxation_form,
    :organization,
    :declaration_task,
    :payment_task,
    :id,
    :name,
    :receipts,
    :exchange_difference,
    :gross_revenue,
    :sum_tax,
    :payment_period,
    :declaration_period,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :activity,
    :taxation_form,
    :organization,
    :declaration_task,
    :payment_task,
    :name,
    :receipts,
    :exchange_difference,
    :gross_revenue,
    :sum_tax,
    :payment_period,
    :declaration_period,
  ].freeze

  # Overwrite this method to customize how taxes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tax)
  #   "Tax ##{tax.id}"
  # end
end
