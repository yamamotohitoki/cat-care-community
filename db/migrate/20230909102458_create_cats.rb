class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.integer :member_id, null: false
      t.integer :breed_id, null: false
      t.string :name, null: false
      t.date :birthday
      t.integer :sex, default: "0"
      t.text :introduction
      t.date :family_join_day
      t.integer :weight
      t.integer :ideal_weight
      t.timestamps
    end
  end
end
