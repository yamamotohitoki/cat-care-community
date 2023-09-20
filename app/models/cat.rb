class Cat < ApplicationRecord

  belongs_to :member
  belongs_to :breed

  has_one_attached :image
  

  def save_breed(breed_name)
    # 既存の猫の種類を検索するか、新しい猫の種類を作成する
    self.breed = Breed.find_or_create_by(name: breed_name)
  end
end
