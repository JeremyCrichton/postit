class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  # on: :create means it only fires for a new registration, not an update
  validates :password, presence: true, on: :create, length: { minimum: 4 }
end
 