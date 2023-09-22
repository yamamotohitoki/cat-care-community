class ChangeDatatypeWeightOfCats < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :weight, :float
  end
end
