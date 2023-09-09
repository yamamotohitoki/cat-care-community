class CreateBlogComments < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_comments do |t|
      t.integer :member_id, null: false
      t.integer :blog_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
