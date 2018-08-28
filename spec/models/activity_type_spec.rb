# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityType, type: :model do
  let(:activity_type) { build :activity_type }

  it 'is valid with valid attributes' do
    expect(activity_type).to be_valid
  end

  it 'is not valid without a name' do
    activity_type.name = nil
    expect(activity_type).to_not be_valid
  end
end
