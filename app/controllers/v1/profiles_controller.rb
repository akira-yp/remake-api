class V1::ProfilesController < ApplicationController
  before_action :authenticate_v1_user!, only: [:create, :ediit, :update]

  def create
    profile = Profile.new(profile_params)
    if profile.save
      render json: profile, methods: [:avatar_url, :works_url]
    else
      render json: profile.errors, status: :bad_requst
    end
  end

  def show
    profile = User.find(params[:id]).profile
    render json: profile , methods: [:avatar_url, :works_url]
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_params)
      render json: profile, method: [:avatar_url, :works_url]
    else
      render json: profile.errors, status: :bad_request
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:id, :description, :greeting, :avatar, works:[]).merge(user: current_v1_user)
  end
end
