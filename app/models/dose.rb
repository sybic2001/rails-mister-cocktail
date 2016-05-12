class Dose < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :cocktail
  validates :cocktail, :ingredient, :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
