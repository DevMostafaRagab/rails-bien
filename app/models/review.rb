class Review < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body, presence: true, length: { minimum: 5, maximum: 100 }
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def to_param
    # id.to_s + "-" + title.parameterize
    "#{id}-#{title.parameterize}"
  end
end
