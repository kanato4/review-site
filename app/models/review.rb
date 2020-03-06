class Review < ApplicationRecord
  belongs_to :user
  has_one :spot, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :spot
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :reject_image_blank
  acts_as_taggable


  def reject_image_blank(attributes)
    attributes['id'].blank? && attributes['image'].blank?
  end

  scope :recent, -> (count) { order(id: :desc).limit(count) }

  validates :user_id, presence: true
  validates :title, length: { maximum: 15, allow_blank: true}, presence: true
  validates :description, length: { maximum: 300, allow_blank: true}, presence: true
  validates :rating, presence: true
end
