class Imgpost < ApplicationRecord
  mount_uploader :img, ImgUploader

  belongs_to :user

  validates :name, presence: true
  validates :img, presence: true
end
