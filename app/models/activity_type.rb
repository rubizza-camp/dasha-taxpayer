class ActivityType < ApplicationRecord
  has_and_belongs_to_many :organization_forms
end