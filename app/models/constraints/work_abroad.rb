# frozen_string_literal: true

module Constraints
  class WorkAbroad < Base
    validates :value, inclusion: [true, false], presence: true

    def appropriate?(work_abroad)

      value && work_abroad == 1
    end
  end
end
