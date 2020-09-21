class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..20 }
  # if user_signed_in?
  #   validates :introduction, length: { in: 1..50 }
  # end

  has_many :books, dependent: :destroy
  attachment :profile_image
end
