class Community < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_many :member_communities, dependent: :destroy

  has_one_attached :image
end
