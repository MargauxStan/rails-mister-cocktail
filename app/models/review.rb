class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :content}
  validates :rating, presence: true
end
