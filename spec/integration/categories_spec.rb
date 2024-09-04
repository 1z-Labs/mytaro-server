require 'swagger_helper'

RSpec.describe 'Categories API', type: :request do
  path '/categories' do

    get '카테고리 정보를 가져옵니다.' do
      tags 'Categories'
      produces 'application/json'

      context '카테고리가 있을 때' do
        response '200', '카테고리 정보를 가져옵니다.' do
          schema type: :array, items: {
            type: :object, properties: {
              id: { type: :string },
              name: { type: :string },
              icon: { type: :string }
            },
            required: ['id', 'name', 'icon']
          }

          before do
            Category.create(id: SecureRandom.uuid, name: 'Test Category', icon: 'icon_url')
          end

          run_test!
        end
      end

      context '카테고리가 없을 때' do
        response '404', '카테고리를 찾을 수 없습니다.' do
          before do
            Category.delete_all
          end

          run_test!
        end
      end
    end
  end
end
