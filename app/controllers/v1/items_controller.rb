class V1::ItemsController < ApplicationController
  before_action :authenticate_v1_user!, only:[:create, :destroy]

  def index
    render json: Item.all, methods: [:images_url]
  end

  def create
    item = Item.new(item_params)
    unless item == nil
      if item.save
        render json: item, methods: [:images_url]
      else
        render json: item.errors, status: :bad_requst
      end
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item, methods: [:images_url]
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: item
  end

  private

  def item_params
    params.require(:item).permit(:id, :title, :description, :price, :brand, :category, :condition, :sizing, :status, :sex, :forsale, images:[]).merge(user: current_v1_user)
  end
end
