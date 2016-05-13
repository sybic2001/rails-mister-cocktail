class ChangeTypeRatingToFloatAgain < ActiveRecord::Migration
  def up
    change_column :cocktails, :rating, :float, default: 0
  end

  def down
    change_column :cocktails, :rating, :integer
  end
end
