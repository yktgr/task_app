class User < ApplicationRecord
  has_many :tasks
  validates :name, presence: true
  validates :email, presence: true,
  format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation{email.downcase!}
  has_secure_password
end
