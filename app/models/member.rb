class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :blogs, dependent: :destroy
  has_many :cats, dependent: :destroy
  has_many :communities
  has_many :member_communities, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :profile_image
  has_one_attached :header_image
  
end
