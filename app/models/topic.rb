class Topic < ApplicationRecord

  belongs_to :community

  has_many :topic_comments, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..100 }
  validates :image, presence: true

end
