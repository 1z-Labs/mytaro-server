require 'rails_helper'

RSpec.describe "ContentChapters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/content_chapters/index"
      expect(response).to have_http_status(:success)
    end
  end

end
