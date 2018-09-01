# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    period Time.zone.today..(Time.zone.today + 30)
    date Time.zone.today
  end

  factory :payment_task, class: 'Tasks::Payment', parent: :task do; end
  factory :declaration_task, class: 'Tasks::Declaration', parent: :task do; end
end
