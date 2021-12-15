# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon
  validate :icon_type

  private

  def icon_type
    return unless icon.attached?

    errors.add(:icon, 'アップロード可能なファイルはjpg, png, gifです') unless icon.blob.content_type.in?(%('image/jpeg image/png image/gif'))
  end
end
