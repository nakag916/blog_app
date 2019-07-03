class Article < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc)}

  def short_content
    self.content[0..99] + "..."
  end
end
