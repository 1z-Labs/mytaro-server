require 'swagger_helper'

RSpec.describe 'Contents API', type: :request do
  path '/contents/popular' do
    get '리뷰가 5개 이상인 컨텐츠 정보를 가져옵니다.' do
      tags 'Contents'
      produces 'application/json'

      response '200', '리뷰가 5개 이상인 컨텐츠를 가져옵니다.' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :string },
            title: { type: :string },
            subtitle: { type: :string },
            description: { type: :string },
            imagePath: { type: :string },
            content: { type: :string },
            clover: { type: :integer },
            reviews_count: { type: :integer }
          },
          required: ['id', 'title', 'imagePath', 'content', 'clover']
        }

        run_test!
      end

      response '404', '리뷰가 5개 이상인 컨텐츠가 없습니다.' do
        schema type: :object, properties: {
          message: { type: :string }
        }

        let(:expected_response) { { message: '리뷰가 5개 이상인 컨텐츠가 없습니다.' }.to_json }

        run_test! do |response|
          expect(response.body).to eq(expected_response)
        end
      end
    end
  end
end
