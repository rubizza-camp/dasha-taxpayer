# frozen_string_literal: true

module HintsHelper
  DEFAULT_MESSAGE = 'Oops...no hints found here :('

  def hint_form(hint_owner)
    hint_owner.hint.translates.find_by(locales: 'ru').try(:text) || DEFAULT_MESSAGE
  end

  def identify_tax(name_tax)
    TaxationForm.find_by(name: name_tax)
  end
end
