class ChangeCommentDataTypeInTopicComments < ActiveRecord::Migration[6.1]
  def change
    change_column :topic_comments, :comment, :text
  end
end
