class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_one_attached :image do |attachable|
    attachable.variant :medium, resize_to_limit: [400, 400]
  end

  paginates_per 10

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
end
