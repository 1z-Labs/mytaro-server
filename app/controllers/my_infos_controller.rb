require 'ruby_lunardate'

class MyInfosController < ApplicationController
  before_action :set_my_info, only: [:show, :destroy, :show_p_fields, :show_non_p_fields]

  # GET /my_infos
  def index
    @my_infos = MyInfo.all
    render json: @my_infos
  end

  # POST /my_infos
  def create
    @my_info = MyInfo.new(my_info_params)

    if @my_info.save
      render json: @my_info, status: :created, location: @my_info
    else
      render json: @my_info.errors, status: :unprocessable_entity
    end
  end

  # GET /my_infos/:id
  def show
    render json: @my_info
  end

  # 상대방의 정보를 반환한다.
  # GET /my_infos/:id/p_fields
  def show_p_fields
    # 상대방 생일 음력으로 변환
    p_solar_birthday = @my_info.pBirthday
    p_lunar_date = LunarDate.from_solar(p_solar_birthday.year, p_solar_birthday.month, p_solar_birthday.day)

    render json: {
      pName: @my_info.pName,
      pBirthday: @my_info.pBirthday,
      pBirthtime: @my_info.pBirthtime,
      p_lunar_birthday: {
        year: p_lunar_date.year,
        month: p_lunar_date.month,
        day: p_lunar_date.day,
        #윤달 구분
        is_leap_month: p_lunar_date.is_leap_month
      }
    }
  end

  # 내 정보를 반환
  # GET /my_infos/:id/non_p_fields
  def show_non_p_fields
    # 사용자 생일 음력 변환
    user_solar_birthday = @my_info.birthday
    user_lunar_date = LunarDate.from_solar(user_solar_birthday.year, user_solar_birthday.month, user_solar_birthday.day)

    render json: {
      gender: @my_info.gender,
      birthday: @my_info.birthday,
      birthtime: @my_info.birthtime,
      user_id: @my_info.user_id,
      user_lunar_birthday: {
        year: user_lunar_date.year,
        month: user_lunar_date.month,
        day: user_lunar_date.day,
        #윤달 정보를 반환
        is_leap_month: user_lunar_date.is_leap_month
      }
    }
  end

  # DELETE /my_infos/:id
  def destroy
    @my_info.destroy
    head :no_content
  end

  private

  def set_my_info
    @my_info = MyInfo.find(params[:id])
  end

  def my_info_params
    params.require(:my_info).permit(:gender, :birthday, :birthtime, :pName, :pGender, :pBirthday, :pBirthtime, :user_id)
  end
end
