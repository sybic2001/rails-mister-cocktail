class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.reorder(:rating).reverse_order
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.where.not(id: @cocktail.doses.map(&:ingredient_id))
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    new_rating = ((@cocktail.votes * @cocktail.rating) + params[:cocktail][:rating].to_i) / (@cocktail.votes + 1)
    @cocktail.votes += 1
    @cocktail.rating = new_rating
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
