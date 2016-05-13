class AddRatingToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :rating, :integer, default: 0
  end
end
