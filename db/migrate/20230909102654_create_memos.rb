class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.integer :member_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :start_time, null: false
      t.timestamps
    end
  end
end
