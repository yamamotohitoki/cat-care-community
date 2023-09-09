class Topic < ApplicationRecord
  
  belongs_to :community
  
  has_many :topic_comments
  
  has_one_attached :image
  
end
