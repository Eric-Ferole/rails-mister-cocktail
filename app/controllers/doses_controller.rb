class DosesController < ApplicationController
  before_action :set_cocktail, only: %i(create)

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # don't hesitate to raise to have a look at the params you get
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end

# def create
#     @dose = Dose.new(dose_params)
#     # don't hesitate to raise to have a look at the params you get
#     @ingredient = Ingredient.find(params[:dose][:ingredient_id])
#     raise
#     @dose.cocktail = @cocktail
#     @dose.ingredient = @ingredient
#     if @dose.save
#       redirect_to cocktail_path(@cocktail)
#     else
#       render :new
#     end
#   end
