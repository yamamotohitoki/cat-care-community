class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :title, null: false
      t.text :rule
      t.text :body, null: false
      t.timestamps
    end
  end
end
