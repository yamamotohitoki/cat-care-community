class Blog < ApplicationRecord
  
  belongs_to :member
  
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many_attached :images
  
end
