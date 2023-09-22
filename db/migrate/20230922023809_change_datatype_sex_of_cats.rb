class ChangeDatatypeSexOfCats < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :sex, :integer
  end
end
