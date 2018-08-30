# frozen_string_literal: true

class Tax < ApplicationRecord
  belongs_to :activity
  has_one :taxation_form, through: :activity
  has_one :organization, through: :activity
  has_one :declaration_task, class_name: 'Tasks::Declaration', dependent: :destroy
  has_one :payment_task, class_name: 'Tasks::Payment', dependent: :destroy
end
