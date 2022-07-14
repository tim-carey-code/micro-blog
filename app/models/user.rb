class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :comments, through: :blogs
end
