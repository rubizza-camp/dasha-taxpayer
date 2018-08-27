# frozen_string_literal: true

module Constraints
  class Profit < Base
    validates :value, numericality: {only_float: true}, presence: true

    def appropriate?(profit)
      profit < value
    end
  end
end
