# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  include Rails.application.routes.url_helpers

  has_many :items, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_commit :create_profile, on: :create

  def create_profile
    Profile.create(greeting: "", description: "", user_id: self.id)
  end
end
