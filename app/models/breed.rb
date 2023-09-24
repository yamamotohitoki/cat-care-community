class Breed < ApplicationRecord
  has_many :cat

  validates :name, presence: true, length: { in: 1..25 }
end
