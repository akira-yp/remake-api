class V1::AssignsController < ApplicationController

  def index
    if params[:owner_id]
      assigns = Assign.where(owner_id: params[:owner_id])
      render json: assigns, methods:[:images_url]
    else
      assigns = Assign.where(designer_id: current_v1_user)
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
    render json: assign, methods: [:images_url]
  end

  private

  def assign_params
    params.require(:assign).permit(:description, :budget, :status, :designer_id, images:[]).merge(owner: current_v1_user)
  end

end
