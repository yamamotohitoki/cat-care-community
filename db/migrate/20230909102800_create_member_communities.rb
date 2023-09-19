class CreateMemberCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :member_communities do |t|
      t.integer :member_id, null: false
      t.integer :community_id, null: false
      t.timestamps
    end
  end
end
