class GenesController < ApplicationController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:show, :edit, :new, :destroy, :update, :create]
  before_action :set_isolated, only: [:new, :edit, :update, :create]

  # GET /genes
  # GET /genes.json
  def index
    if params[:search]
      @genes = Gene.search(params[:search]).order(:name, :reference).paginate(:per_page => 3, :page => params[:page])
    else
      @genes = Gene.all.order(:name, :reference).paginate(:per_page => 3, :page => params[:page])
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
  end

  # GET /genes/new
  def new
    @gene = Gene.new
    @isol = params[:newg] #isolated.id
  end

  # GET /genes/1/edit
  def edit
  end

  # POST /genes
  # POST /genes.json
  def create
    @gene = Gene.new(gene_params)

    respond_to do |format|
      if @gene.save
        format.html { redirect_to @gene, notice: 'Gene was successfully created.' }
        format.json { render :show, status: :created, location: @gene }
      else
        format.html { render :new }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genes/1
  # PATCH/PUT /genes/1.json
  def update
    respond_to do |format|
      if @gene.update(gene_params)
        format.html { redirect_to @gene, notice: 'Gene was successfully updated.' }
        format.json { render :show, status: :ok, location: @gene }
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to genes_url, notice: 'Gene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gene
      @gene = Gene.find(params[:id])
    end

  

    # Never trust parameters from the scary internet, only allow the white list through.
    def gene_params
      params.require(:gene).permit(:name, :sequence, :reference, :uniprot, :symbol, :isolated_id)
    end

    def set_isolated
        @isolateds = Isolated.all
    end
end
