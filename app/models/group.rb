class Group < ApplicationRecord
  has_many :group_user
  has_many :users, through: :group_user

  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
