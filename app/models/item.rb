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
    # if images.attached?
    #   images_array = []
    #   images.each do |image|
    #     url = Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    #     images_array.push(url)
    #   end
    #   images_array
    # else
    #   []
    # end
  end
end
