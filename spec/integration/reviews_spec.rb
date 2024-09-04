require 'swagger_helper'

RSpec.describe 'Reviews API', type: :request do
  path '/contents/{content_id}/reviews' do
    parameter name: :content_id, in: :path, type: :string, description: 'Content ID'

    get '해당 사주 컨텐츠의 리뷰 정보를 가져옵니다.' do
      tags 'Reviews'
      produces 'application/json'

      context '리뷰가 있을 때' do
        response '200', '해당 컨텐츠의 리뷰를 가져옵니다.' do
          schema type: :array, items: {
            type: :object, properties: {
              id: { type: :string },
              review: { type: :string },
              author: { type: :string },
              contentId: { type: :string },
              authorId: { type: :string },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            },
            required: ['id', 'review', 'author', 'contentId', 'authorId', 'created_at', 'updated_at']
          }

          let(:content) { Content.create!(id: '6cbfac3d-6a67-11ef-857c-42010a400006', title: '짝사랑사주비책', subtitle: '짝사랑두근두근', description: '짝사랑을 이뤄주는 사주비책입니다.', imagePath: '@assets/images/contents/thumbnail1.svg', content: '컨텐츠', clover: 50) }
          let(:user) { User.create!(id: 'a7816aa6-6a67-11ef-857c-42010a400006', nickname: '린', phone: '010-1111-1111', isBeforePurchased: false) }
          let(:content_id) { content.id }

          before do
            Review.create!(id: SecureRandom.uuid, review: 'Great content!', authorId: user.id, contentId: content.id)
          end

          run_test!
        end
      end

      context '리뷰가 없을 때' do
        response '404', '리뷰를 찾을 수 없습니다.' do
          let(:content) { Content.create!(id: '6cbfac3d-6a67-11ef-857c-42010a400006', title: '짝사랑사주비책', subtitle: '짝사랑두근두근', description: '짝사랑을 이뤄주는 사주비책입니다.', imagePath: '@assets/images/contents/thumbnail1.svg', content: '컨텐츠', clover: 50) }
          let(:content_id) { content.id }

          before do
            Review.delete_all
          end

          run_test!
        end
      end
    end
  end
end
