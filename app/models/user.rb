class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  enum gender: {男性: 1, 女性: 2, その他: 0, 回答しない: 9}

  validates :nickname, length: { maximum: 15, message: 'は15文字以内で記入してください', allow_blank: true}, presence: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/,  allow_blank: true}, presence: true
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6, allow_blank: true}, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :telephone, length: { maximum: 11, too_long: 'は11文字以内で記入してください'}
end
