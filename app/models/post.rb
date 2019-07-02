class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbaity

  def title_is_clickbaity
    if self.title.present?
      if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top [number]") && !self.title.include?("Guess") &&
         errors.add(:title, "must have clickbait")
      end
    end
  end
end

# Finally, add a custom validator to `Post` that ensures the title is sufficiently
# clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.
