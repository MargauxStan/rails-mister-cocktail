class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @reviews_cocktail = @cocktail.reviews
    @dose = Dose.new
    @reviews = Review.all
    @review = Review.new
  end

  def search
    @cocktail = Cocktail.where("name LIKE %#{params[:name]}%")
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(get_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def get_params
    params.require(:cocktail).permit(:name, :image_url, :photo)
  end
end
