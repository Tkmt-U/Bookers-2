class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :follew_relationships, class_name: "Relationship", foreign_key: "follew_id", dependent: :destroy
  has_many :follews, through: :follew_relationships, source: :follewed
  has_many :follewed_relationships, class_name: "Relationship", foreign_key: "follewed_id", dependent: :destroy
  has_many :follewed, through: :follewed_relationships, source: :follew

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  attachment :profile_image
end
