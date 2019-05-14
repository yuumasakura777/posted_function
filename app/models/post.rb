class Post < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user

  validates :content, presence: true, length: {maximum: 50}

  #投稿にいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  #投稿のいいねの解除
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  #現在のユーザーがいいねしてたらtrueを返す
  def iine?(user)
    iine_users.include?(user)
  end

end
