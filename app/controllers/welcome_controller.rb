class WelcomeController < ApplicationController
  def index
  	
      
      @searchs = Organism.search(params[:search])
      @searchs1 = Isolated.search(params[:search])
    
  end

 
end
