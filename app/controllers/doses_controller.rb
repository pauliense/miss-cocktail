class DosesController < ApplicationController

  before_action :set_cocktail
  before_action :find_dose, only: [:edit, :update, :destroy]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # show them the form again with all their data & an error message
      render "cocktails/show"
    end
  end

  def edit
    find_dose
  end

  def update
    @dose.update(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # show them the form again with all their data & an error message
      render :new
    end
  end

  def destroy
    find_dose
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end






