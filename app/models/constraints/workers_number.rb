# frozen_string_literal: true

module Constraints
  class WorkersNumber < Base
    validates :value, numericality: {only_integer: true}, presence: true
  end
end
