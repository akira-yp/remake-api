class Item < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many_attached :images

  def images_url
    if images.attached?
      images.map{|image| url_for(image)}
    else
      []
    end
  end
end
