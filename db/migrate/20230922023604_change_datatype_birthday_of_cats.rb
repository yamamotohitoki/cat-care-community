class ChangeDatatypeBirthdayOfCats < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :birthday, :date
  end
end
