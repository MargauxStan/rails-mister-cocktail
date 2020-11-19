class DosesController < ApplicationController
  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.new(get_params)
    dose.cocktail = cocktail

    if dose.save
      redirect_to cocktail_path(cocktail)
    end
  end

  def destroy
  end

  def get_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
