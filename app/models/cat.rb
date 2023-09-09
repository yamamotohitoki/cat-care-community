class Cat < ApplicationRecord
  
  belongs_to :member
  belongs_to :breed
  
  has_one_attached :image
  
end
