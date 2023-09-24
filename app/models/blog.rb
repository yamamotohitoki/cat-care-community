class Blog < ApplicationRecord

  belongs_to :member

  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..100 }


  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  # 公開非公開
  enum status: { public: 0, private: 1 }, _prefix: true

  def self.looks(search, word)
    if search == "perfect_match"
      @blog = Blog.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @blog = Blog.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @blog = Blog.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @blog = Blog.where("title LIKE?","%#{word}%")
    else
      @blog = Blog.all
    end
  end
end
