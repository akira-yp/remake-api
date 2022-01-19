class V1::AssignsController < ApplicationController
  before_action :authenticate_v1_user!, only: [:update]

  def index
    if params[:owner_id]
      assigns = Assign.where(owner_id: params[:owner_id])
      render json: assigns, methods:[:images_url]
    else
      assigns = Assign.where(designer_id: params[:designer_id])
      render json: assigns, methods:[:images_url]
    end
  end

  def create
    assign = Assign.new(assign_params)
    if assign.save
      render json: assign, methods: [:images_url]
    else
      render json: assign.errors, status: :bad_request
    end
  end

  def show
    assign = Assign.find(params[:id])
    assign = {
      id: assign.id,
      description: assign.description,
      budget: assign.budget,
      status: assign.status,
      owner_id: assign.owner_id,
      owner_avatar: assign.owner.profile.avatar_url,
      owner_name:  assign.owner.name,
      designer_id: assign.designer_id,
      designer_avatar: assign.designer.profile.avatar_url,
      designer_name: assign.designer.name,
      images_url: assign.images_url
    }
    render json: assign
  end

  def update
    assign = Assign.find(params[:id])
    if assign.update(budget_params)
      render json: assign
    else
      render json: assign.errors, status: :bad_request
    end
  end

  private

  def assign_params
    params.require(:assign).permit(:id, :description, :budget, :status, :designer_id, images:[]).merge(owner: current_v1_user)
  end

  def budget_params
    params.require(:assign).permit(:id, :budget)
  end
end
