class ReviewsController < ApplicationController


  def new
    @review = Review.new
  end

  def create
    find_cocktail
    @review = Review.new(review_params)
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


 private

 def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end



end
