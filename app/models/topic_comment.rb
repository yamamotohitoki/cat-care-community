class TopicComment < ApplicationRecord

  belongs_to :member
  belongs_to :topic

  validates :comment, presence: true, length: { in: 1..100 }
end
