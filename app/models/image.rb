class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :review

  validates :image, presence: true 
end
