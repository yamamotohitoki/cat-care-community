class Memo < ApplicationRecord

  belongs_to :member

  validates :title, presence: true
  validates :start_time, presence: true

end
