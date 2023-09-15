class AddStatusToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :status, :integur, null: false, default: 0
  end
end
