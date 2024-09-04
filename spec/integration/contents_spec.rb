require 'swagger_helper'

RSpec.describe 'Contents API', type: :request do

  # 리뷰가 5개 이상인 인기 콘텐츠를 가져오는 API
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

  # 카테고리별로 리뷰 수 기준으로 정렬된 콘텐츠를 가져오는 API
  path '/contents/category/{category_id}/reviews' do
    get '카테고리별 인기 많은 순으로 컨텐츠를 가져옵니다.' do
      tags 'Contents'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :category_id, in: :path, type: :string, description: 'Category ID'

      response '200', 'contents found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :string },
                   title: { type: :string },
                   subtitle: { type: :string },
                   description: { type: :string },
                   imagePath: { type: :string },
                   content: { type: :string },
                   clover: { type: :integer },
                   review_count: { type: :integer }
                 },
                 required: ['id', 'title', 'subtitle', 'description', 'imagePath', 'content', 'clover', 'review_count']
               }

        run_test!
      end

      response '404', 'category not found' do
        let(:category_id) { 'invalid' }
        run_test!
      end
    end
  end

  # 특정 ID를 가진 콘텐츠를 조회하는 API
  path '/contents/{id}' do
    get '특정 컨텐츠 정보를 가져옵니다.' do
      tags 'Contents'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Content ID'

      response '200', 'content found' do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 title: { type: :string },
                 subtitle: { type: :string },
                 description: { type: :string },
                 imagePath: { type: :string },
                 content: { type: :string },
                 clover: { type: :integer }
               },
               required: ['id', 'title', 'imagePath', 'content', 'clover']

        run_test!
      end

      response '404', 'content not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  # 전체 콘텐츠를 리뷰 수 기준으로 정렬하여 반환하는 API
  path '/contents/reviews' do
    get '전체 컨텐츠를 리뷰 수 기준으로 가져옵니다.' do
      tags 'Contents'
      produces 'application/json'

      response '200', '정렬된 컨텐츠를 가져옵니다.' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :string },
                   title: { type: :string },
                   subtitle: { type: :string },
                   description: { type: :string },
                   imagePath: { type: :string },
                   content: { type: :string },
                   clover: { type: :integer },
                   review_count: { type: :integer }
                 },
                 required: ['id', 'title', 'subtitle', 'description', 'imagePath', 'content', 'clover', 'review_count']
               }

        run_test!
      end

      response '404', '콘텐츠가 없습니다.' do
        let(:expected_response) { { message: '콘텐츠가 없습니다.' }.to_json }

        run_test! do |response|
          expect(response.body).to eq(expected_response)
        end
      end
    end
  end

  # 카테고리별로 모든 콘텐츠를 가져오는 API
  path '/contents/category/{category_id}' do
    get '카테고리별로 모든 컨텐츠를 가져옵니다.' do
      tags 'Contents'
      produces 'application/json'
      parameter name: :category_id, in: :path, type: :string, description: 'Category ID'

      response '200', 'contents found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :string },
                   title: { type: :string },
                   subtitle: { type: :string },
                   description: { type: :string },
                   imagePath: { type: :string },
                   content: { type: :string },
                   clover: { type: :integer }
                 },
                 required: ['id', 'title', 'subtitle', 'description', 'imagePath', 'content', 'clover']
               }

        run_test!
      end

      response '404', 'category not found' do
        let(:category_id) { 'invalid' }
        schema type: :object, properties: {
          message: { type: :string }
        }

        run_test!
      end
    end
  end
end
