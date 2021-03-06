class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i(show destroy)

  def index
    @cocktails = Cocktail.all
  end

  def show
    # @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktails_params
      params.require(:cocktail).permit(:name)
    end
end
