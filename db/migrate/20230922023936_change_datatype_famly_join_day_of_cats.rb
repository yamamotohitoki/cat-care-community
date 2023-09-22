class ChangeDatatypeFamlyJoinDayOfCats < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :family_join_day, :date
  end
end
