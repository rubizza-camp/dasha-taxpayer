# frozen_string_literal: true

module Constraints
  class Profit < Base
    validates :value, numericality: {only_float: true}, presence: true
  end
end
