require 'swagger_helper'

RSpec.describe 'MyInfos API', type: :request do
  path '/my_infos' do
    get '모든 my_infos 조회' do
      tags 'MyInfos'
      produces 'application/json'
      response '200', '모든 my_infos 조회' do
        schema type: :array,
               items: { '$ref': '#/components/schemas/MyInfo' }
        run_test!
      end
    end

    post 'my_info 생성' do
      tags 'MyInfos'
      consumes 'application/json'
      parameter name: :my_info, in: :body, schema: {
        '$ref': '#/components/schemas/MyInfo'
      }
      response '201', 'my_info 생성' do
        schema '$ref': '#/components/schemas/MyInfo'
        run_test!
      end

      response '422', '잘못된 요청일 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}' do
    get '특정 my_info를 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '특정 my_info를 조회' do
        schema '$ref': '#/components/schemas/MyInfo'
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end

    delete 'my_info 삭제' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      response '204', 'my_info 삭제' do
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}/answer' do
    get '특정 my_info의 답변을 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '특정 my_info의 답변을 조회' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 answer: { type: :string }
               },
               required: ['id', 'answer']
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}/p_fields' do
    get '상대방 정보 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '상대방 정보 조회' do
        schema type: :object,
               properties: {
                 pName: { type: :string },
                 pBirthday: { type: :string, format: :date },
                 pBirthtime: { type: :string },
                 p_lunar_birthday: {
                   type: :object,
                   properties: {
                     year: { type: :integer },
                     month: { type: :integer },
                     day: { type: :integer },
                     is_leap_month: { type: :boolean }
                   },
                   required: ['year', 'month', 'day', 'is_leap_month']
                 }
               },
               required: ['pName', 'pBirthday', 'pBirthtime', 'p_lunar_birthday']
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}/non_p_fields' do
    get '사용자 정보 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '사용자 정보 조회' do
        schema type: :object,
               properties: {
                 gender: { type: :string },
                 birthday: { type: :string, format: :date },
                 birthtime: { type: :string },
                 user_id: { type: :integer },
                 user_lunar_birthday: {
                   type: :object,
                   properties: {
                     year: { type: :integer },
                     month: { type: :integer },
                     day: { type: :integer },
                     is_leap_month: { type: :boolean }
                   },
                   required: ['year', 'month', 'day', 'is_leap_month']
                 }
               },
               required: ['gender', 'birthday', 'birthtime', 'user_id', 'user_lunar_birthday']
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}/p_saju' do
    get '특정 my_info의 p_saju를 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '특정 my_info의 p_saju를 조회' do
        schema type: :object,
               properties: {
                 pName: { type: :string },
                 p_saju: { type: :string }  # saju를 문자열로 가정
               },
               required: ['pName', 'p_saju']
        run_test!
      end

      response '404', 'my_info를 찾을 수 없을 경우 오류 메시지를 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end

  path '/my_infos/{id}/user_saju' do
    get '사용자 정보 조회' do
      tags 'MyInfos'
      parameter name: :id, in: :path, type: :integer
      produces 'application/json'
      response '200', '사용자 정보 조회' do
        schema type: :object,
               properties: {
                 gender: { type: :string },
                 user_saju: { type: :string }  # saju를 문자열로 가정
               },
               required: ['gender', 'user_saju']
        run_test!
      end

      response '404', '사용자를 찾을 수 없는 경우 오류 반환' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']
        run_test!
      end
    end
  end
end
