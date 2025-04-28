require 'rails_helper'

RSpec.describe "Api::V1::CustomersController", type: :request do
  describe "POST /api/v1/customers/invite" do
    let(:file_path) { Rails.root.join('spec', 'fixtures', 'files', 'valid_customers.txt') }

    it "returns invited customers within 100km" do
      post "/api/v1/customers/invite", params: { file: fixture_file_upload(file_path, 'text/plain') }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)

      expect(json_response.first).to have_key("user_id")
      expect(json_response.first).to have_key("name")
    end
  end
end