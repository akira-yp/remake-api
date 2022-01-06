class Assign < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :designer, class_name: 'User', foreign_key: :designer_id
  has_many: chats, dependent: :destroy

  has_many_attached :images

  def images_url
    if images.attached?
      images.map{|image| url_for(image)}
    else
      []
    end
  end
end
