# frozen_string_literal: true

class TaxesController < ApplicationController
  before_action only: %i[show]
  before_action :authenticate_user!

  def index
    @taxes = []
    current_user.organizations.each do |organization|
      @taxes << TaxesBuilder.new(organization)
    end
    @taxes.sort_by! {|el| el.period_event.last }
  end

  class TaxesBuilder
    attr_reader :period_event, :name, :rate, :organization

    def initialize(organization)
      @period_event = build_period_event(organization)
      @name = build_name_tax(organization)
      @rate = build_rate_tax(organization)
      @organization = build_name_organition(organization)
    end

    def build_period_event(organization)
      current_date = Time.zone.today
      if organization.taxation_form.period_type == 'month'
        current_date..Date.new(current_date.year, current_date.month + 1, 1)
      elsif organization.taxation_form.period_type == 'quarter'
        new_declaration_month = current_date.month + (3 - current_date.month % 3) + 1
        current_date..Date.new(current_date.year + new_declaration_month / 12, new_declaration_month % 12, 22)
      end
    end

    def build_name_tax(organization)
      organization.taxation_form.name
    end

    def build_rate_tax(organization)
      if organization.taxation_form.name == 'Единый налог'
        @rate = '109.22'
      elsif organization.taxation_form.name == 'УСН'
        @rate = '5% от выручки'
      end
    end

    def build_name_organition(organization)
      organization.name
    end
  end
end
