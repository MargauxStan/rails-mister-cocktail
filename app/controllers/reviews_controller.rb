class ReviewsController < ApplicationController
  def new
  end

  def create
    review = Review.new(get_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    review.cocktail = cocktail
    if review.save
      redirect_to cocktail_path(cocktail)
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    cocktail = Cocktail.find(params[:cocktail_id])
    
    redirect_to cocktail_path(cocktail)
  end

  def get_params
    params.require(:review).permit(:content, :rating)
  end
end
