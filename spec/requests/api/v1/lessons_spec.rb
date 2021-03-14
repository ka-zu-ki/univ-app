require 'rails_helper'

RSpec.describe "Api::V1::Lessons", type: :request do
  let!(:user) { create(:user) }
  let!(:lessons) { create_list(:lesson, 3) }

  describe "GET /api/v1/lessons" do
    it "200 Status" do
      get api_v1_lessons_path
      expect(response).to have_http_status(200)
    end
  end
end
