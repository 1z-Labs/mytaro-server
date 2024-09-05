require 'rails_helper'

RSpec.describe "ContentPreviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/content_previews/index"
      expect(response).to have_http_status(:success)
    end
  end

end
