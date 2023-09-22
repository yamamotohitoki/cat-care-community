class ChangeColumnDefaultToCats < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cats, :sex, from: nil, to: "0"
  end
end
