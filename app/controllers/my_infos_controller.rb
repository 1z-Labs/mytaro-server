class MyInfosController < ApplicationController
  before_action :set_my_info, only: [:show, :destroy, :show_p_fields, :show_non_p_fields]


  #Get /my_infos
  def index
    @my_infos = MyInfo.all
    render json: @my_infos
  end


  #Post /my_infos
  def create
    @my_info = MyInfo.new(my_info_params)

    if @my_info.save
      render json: @my_info, status: :created, location: @my_info
    else
      render json: @my_info.errors, status: :unprocessable_entity
    end
  end

  #Get /my_infos/:id
  def show
    render json: @my_info
  end

  #상대방의 정보를 반환한다.
  #Get /my_infos/:id/non_p_fields
  def show_p_fields
    render json: @my_info.slice(:pName, :pBirthday, :pBirthtime)
  end


  # 내 정보를 반환
  # GET /my_infos/:id/non_p_fields
  def show_non_p_fields
    render json: @my_info.slice(:gender, :birthday, :birthtime,:user_id)
  end

  #DELETE /my_infos/:id
  def destroy
    @my_info.destroy
    head :no_content
  end

  def set_my_info
    @my_info = MyInfo.find(params[:id])
  end

  def my_info_params
    params.require(:my_info).permit(:gender, :birthday, :birthtime, :pName, :pGender, :pBirthday, :pBirthtime, :user_id)
  end
end