class Topic < ApplicationRecord

  belongs_to :community

  has_many :topic_comments, dependent: :destroy

  has_one_attached :image
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
