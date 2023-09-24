class BlogComment < ApplicationRecord

  belongs_to :member
  belongs_to :blog

  validates :comment, presence: true, length: { in: 1..100 }

end
