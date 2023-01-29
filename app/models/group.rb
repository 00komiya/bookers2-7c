class Group < ApplicationRecord
  has_many :group_user
  has_many :users, through: :group_user

  validates :name, presence: true
  validates :introduction, presece: true
  has_one_attached :group_image
end
