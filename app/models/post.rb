class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  
  # Custom validation
  validate :title_should_contain

  TITLE_NOT_CONTAIN = [
    /Won't Believe/i,
    /Secret/i,
    /Top/i,
    /Guess/i

  ]
  def title_should_contain
      if TITLE_NOT_CONTAIN.none? { |word| word.match title}
          errors.add(:title, "Title not clickbaity enough")
      end
  end

end
