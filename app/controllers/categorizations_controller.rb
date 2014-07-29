class CategorizationsController < ApplicationController
  def new
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = Categorization.new
  end
  
  def create
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = @kitten.categorizations.new(params.require(:categorization).permit(:category_id))
    @categorization.save
    redirect_to root_path
  end
end