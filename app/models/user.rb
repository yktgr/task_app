class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true,
  format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation{email.downcase!}
  has_secure_password
  before_destroy do
      if self.admin? && User.where(admin:true).count == 1
          throw :abort
      end
  end
end
