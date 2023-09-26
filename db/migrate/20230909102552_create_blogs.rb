class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.integer :member_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
