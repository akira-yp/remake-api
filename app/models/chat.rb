class Chat < ApplicationRecord]
  include Rails.application.routes.url_helpers

  belongs_to :assign
  belongs_to :user

  has_one_attached: figure

  def figure_url
    figure.attached? ? url_for(figure) : nil
  end
end
