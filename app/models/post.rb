class Post < ApplicationRecord

  belongs_to :user
  #いいね機能関連
  has_many :links, dependent: :destroy

  validates :content, presence: true

  #ユーザーがいいねしているかどうか確かめる
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
