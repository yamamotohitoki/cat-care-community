class Blog < ApplicationRecord

  belongs_to :member

  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :images

  mount_uploader :image, ImageUploader

  # 公開非公開
  enum status: { public: 0, private: 1 }, _prefix: true
end
