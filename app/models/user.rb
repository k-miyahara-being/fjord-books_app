# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :town, presence: true

  def username_or_email
    username.presence || email
  end
end
