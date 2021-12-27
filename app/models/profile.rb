class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :avatar
  has_many_attached :works

  def avatar_url
    avatar.attached? ? url_for(avatar) : nil
  end

  def works_url
    if works.attached?
      works.map{|work| url_for(work)}
    else
      []
    end
  end
end
