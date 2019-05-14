class User < ApplicationRecord

  has_secure_password

  has_many :posts
  has_many :imgposts
  has_many :likes, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8}





end
