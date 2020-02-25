class Review < ApplicationRecord
  belongs_to :user
  has_one :spot
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :spot
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :reject_image_blank
  acts_as_taggable


  def reject_image_blank(attributes)
    attributes['id'].blank? && attributes['image'].blank?
  end

  scope :recent, -> (count) { order(id: :desc).limit(count) }
end
