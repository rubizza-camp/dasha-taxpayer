# frozen_string_literal: true

class BasePresenter < SimpleDelegator
  attr_reader :model, :view

  def initialize(model, view=nil)
    @model = model
    @view  = view
    super(@model)
  end
end
