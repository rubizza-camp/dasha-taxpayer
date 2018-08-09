# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe PagesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Style/StringLiterals
