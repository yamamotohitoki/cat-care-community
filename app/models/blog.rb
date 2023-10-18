class Blog < ApplicationRecord

  belongs_to :member

  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def get_image
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/blog-no-image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/png')
  end
    image.variant(resize_to_fit: [1000, 200]).processed
  end

  validates :title, presence: true, length: { in: 1..20 }
  validates :body, presence: true, length: { in: 1..500 }


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
