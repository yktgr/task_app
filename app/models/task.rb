class Task < ApplicationRecord
  validates :title, presence:true
  validates :content, presence:true

  scope :expired, -> {order(expired_at: :desc)}
  scope :search_title, -> (title){where('title Like ?',"%#{title}%")}
  scope :search_status, -> (status){where('status = ?',status)}
  scope :search_all,-> (title,status){where('title Like ? and status = ?',"%#{title}%",status)}
end
