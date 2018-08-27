# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'default_status' do
    it 'return status pending' do
      expect(described_class.new.status).to eq('pending')
    end
  end

  context 'when we change task status' do
    let!(:task) { described_class.create }

    it 'return status complete' do
      task.completed

      expect(task.status).to eq('completed')
    end

    it 'return status failed' do
      task.failed

      expect(task.status).to eq('failed')
    end
  end
end
