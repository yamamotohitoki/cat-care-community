class Cat < ApplicationRecord

  belongs_to :member
  belongs_to :breed

  has_one_attached :image

  validates :name, presence: true,length: { in: 1..20 }
  validates :introduction,    length: { in: 1..75 }


  enum sex: { male: 0, female: 1 }

  def full_name
    if female?
      "#{name}ちゃん"
    else
      "#{name}くん"
    end
  end


  def save_breed(breed_name)
    errors.add(:name, "1文字以上で入力してください!!!!") if breed_name.length == 0
    # 既存の猫の種類を検索するか、新しい猫の種類を作成する
    self.breed = Breed.find_or_create_by(name: breed_name)
  end
end
