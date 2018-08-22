# frozen_string_literal: true

module Constraints
  class WorkAbroad < Base
    validates :value, inclusion: [true, false], presence: true
  end
end
