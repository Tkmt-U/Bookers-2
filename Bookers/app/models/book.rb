class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { in: 0..200 }

  def favorited?(user)
    # binding.pry
    favorites.where(user_id: user.id).exists?
  end
end
