class AddVotesToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :votes, :integer, default: 0
  end
end
