class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @search = params[:search]
    return @cocktails = Cocktail.search_by_name(@search) if @search
    return @cocktails if @search != @cocktail
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
