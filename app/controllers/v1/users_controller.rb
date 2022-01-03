class V1::UsersController < ApplicationController
  # before_action :authenticate_v1_user!, only: [:update]

  def index
    designers = User.where(designer: true).select('id', 'name')
    designers = designers.map do |designer|
      { id: designer.id, name: designer.name, avatar: designer.profile.avatar_url}
    end
    render json: designers
  end

  def show
    designer = User.find(params[:id])
    render json: designer
  end
end
