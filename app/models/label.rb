class Label < ApplicationRecord
  has_many :task_label
  has_many :tasks, through: :task_label
end
