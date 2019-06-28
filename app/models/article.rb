class Article < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc)}

  def short_content
    temp = self.content[0..100] + "..."
    self.content = temp
  end
end
