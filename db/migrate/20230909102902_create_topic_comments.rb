class CreateTopicComments < ActiveRecord::Migration[6.1]
  def change
    create_table :topic_comments do |t|
      t.integer :member_id, null: false
      t.integer :topic_id, null: false
      t.integer :comment, null: false
      t.timestamps
    end
  end
end
