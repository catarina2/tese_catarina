class WelcomeController < ApplicationController
  def index
  	
  	  @search = Organism.all.paginate(:per_page => 3, :page => params[:page])
  	  #organism
  	  if params[:searchtable] == "Organisms"
      		@search = Organism.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #origin
      elsif params[:searchtable] == "Origins"
      		@search = Origin.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #drug
      elsif params[:searchtable] == "Drugs"
      		@search = Drug.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #isolated
      elsif params[:searchtable] == "Isolateds"
      		@search = Isolated.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #gene
      elsif params[:searchtable] == "Genes"
      		@search = Gene.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #mutation
      elsif params[:searchtable] == "Mutations"
      		@search = Mutation.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      #Mutation/publication 
      elsif params[:searchtable] == "Mutation/Publication"
      		@search = Mutpub.search(params[:search]).paginate(:per_page => 3, :page => params[:page])	
      #Publication 
  	  elsif params[:searchtable] == "Publications"
      		@search = Publication.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
	  #Drug/isolated
	  elsif params[:searchtable] == "Isolated/Drug"
      		@search = Resist.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
	  #Gene/Mutation
	  elsif params[:searchtable] == "Gene/Mutation"
      		@search = Stat.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
      end
     
    
  end

 
end
