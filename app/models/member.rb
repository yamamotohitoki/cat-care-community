class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]

  has_many :blogs, dependent: :destroy
  has_many :cats, dependent: :destroy
  has_many :communities
  has_many :member_communities, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog

  has_one_attached :profile_image

  validates :introduction, length: {maximum: 140}
  validates :name, presence: true, length: { in: 1..10 }


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲスト"
    end
  end

  def guest?
    email == 'guest@example.com'
  end

  def member_status
    if is_active == true
      "有効"
    else
      "退会"
    end
  end

  def active_for_authentication?
    super && (is_active == true)
  end
end
