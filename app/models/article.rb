class Article < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc)}
end
