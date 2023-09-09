class TopicComment < ApplicationRecord
  
  belongs_to :member
  belongs_to :topic
  
end
