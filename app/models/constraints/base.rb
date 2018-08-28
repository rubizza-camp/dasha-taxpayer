# frozen_string_literal: true

module Constraints
  class Base < Constraint
    serialize :value

    def appropriate_by_params?(params)
      appropriate?(params[self.class.to_s.demodulize.underscore].to_i)
    end
  end
end
