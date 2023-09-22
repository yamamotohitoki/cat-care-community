class ChangeDatatypeIdealWeightOfCats < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :ideal_weight, :float
  end
end
