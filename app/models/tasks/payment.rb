# frozen_string_literal: true

module Tasks
  class Payment < Task
    belongs_to :tax
  end
end
