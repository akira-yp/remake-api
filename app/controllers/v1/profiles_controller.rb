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

  private

  def profile_params
    params.require(:profile).permit(:description, :greeting, :avatar, works:[]).merge(user: current_v1_user)
  end
end
