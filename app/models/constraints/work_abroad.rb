# frozen_string_literal: true

module Constraints
  class WorkAbroad < Base
    validates :value, inclusion: [true, false], presence: true

    def appropriate?(work_abroad)
      work_abroad == (value ? 1 : 0)
    end
  end
end
