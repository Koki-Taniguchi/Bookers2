class Book < ApplicationRecord
  belongs_to :user, optional: true

  has_many :comments
  has_many :favorites

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
