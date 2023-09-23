class Community < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_many :member_communities, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
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
