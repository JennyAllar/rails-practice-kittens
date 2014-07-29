class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end
  
  def show
    
  end

end