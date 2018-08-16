# frozen_string_literal: true

module StringHandlingHelper
  def self.delete_first_sym_bom(text)
    text[1..-1] if text.first == "\uFEFF"
  end
end
