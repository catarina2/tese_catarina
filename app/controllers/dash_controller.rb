class DashController < ApplicationController


  # GET /dashboards
  # GET /dashboards.json
  def index
    
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @isolated = Isolated.new
    @isolated.genes.new
    @origins = Origin.all
    @organisms = Organism.all
  end

  # GET /dashboards/1/edit
  def edit

  end

  # POST /dashboards
  # POST /dashboards.json
  def create
   @isolated = Isolated.new(isolated_params)
   

    respond_to do |format|
      if @isolated.save
        format.html { redirect_to @isolated notice: 'Isolated ksjhdçl was successfully created.' }
        format.json { render :show, status: :created, location: @isolated}
      else
        format.html { render :new }
        format.json { render json: @isolated.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def isolated_params
      params.require(:isolated).permit(:name, :disease, :n_samples, :origin_id, :organism_id)
    end
    def gene_params
      params.require(:gene).permit(:name, :sequence, :reference, :uniprot, :symbol)
    end
end
