# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxesAndTasksGenerator do
  let!(:taxation_form) { FactoryBot.create(:taxation_form, :monthly_fixed_price) }
  let!(:activity) { FactoryBot.create(:activity, taxation_form: taxation_form) }

  context '#call' do
    it 'generate taxes and tasks' do
      described_class.call

      tax = Tax.first
      expect(tax.activity).to eq activity
      expect(tax.declaration_period).to be_present
      expect(tax.payment_period).to be_present

      declaration_task = Tasks::Declaration.first
      expect(declaration_task.activity).to eq activity
      expect(declaration_task.tax).to eq tax
      expect(declaration_task.period).to be_present
      expect(declaration_task.date).to be_present

      payment_task = Tasks::Payment.first
      expect(payment_task.activity).to eq activity
      expect(payment_task.tax).to eq tax
      expect(payment_task.period).to be_present
      expect(payment_task.date).to be_present
    end
  end
end
