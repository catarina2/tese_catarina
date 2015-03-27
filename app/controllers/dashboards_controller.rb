class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index
    @dashboards = Dashboard.all
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
    #@isolateds = Isolated.find(params[:isolated_id])
    #@gene = @isolateds.genes.create(gene_params)
    respond_to do |format|
      if @isolated.save
        format.html { redirect_to @isolated, notice: 'Isolated askjhd was successfully created.' }
        format.json { render :show, status: :created, location: @isolated }
      else
        format.html { render :new }
        format.json { render json: @isolated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isolated_params
      params.require(:isolated).permit(:name, :disease, :n_samples, :origin_id, :organism_id)
    end

    def gene_params
      params.require(:gene).permit(:name, :sequence, :reference, :uniprot, :symbol, :isolated_id)
    end

end
