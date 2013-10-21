class Gadget < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
