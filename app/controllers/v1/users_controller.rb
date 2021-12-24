class V1::UsersController < ApplicationController
  # before_action :authenticate_v1_user!

  def index
    designers = User.where(designer: true)
    render json: designers
  end

  def show
    designer = User.find(params[:id])
    render json: design
  end
end
