class ChangeTypeRatingToFloat < ActiveRecord::Migration
  def up
    change_column :cocktails, :rating, :integer
  end

  def down
    change_column :cocktails, :rating, :float, default: 0
  end
end
