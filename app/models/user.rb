class User < ApplicationRecord

  #activestorage
  has_one_attached :image

  #いいね機能関連
  has_many :links, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8}

  has_secure_password

  has_many :posts



end
