class Community < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_many :member_communities, dependent: :destroy
  has_many :members, through: :member_communities, source: :member

  has_one_attached :image

  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..100 }
  validates :image, presence: true
  

  def includes?(member)
    member_communities.exists?(member_id: member.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @community = Community.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @community = Community.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @community = Community.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @community = Community.where("title LIKE?","%#{word}%")
    else
      @community = Community.all
    end
  end
end
