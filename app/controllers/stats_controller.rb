class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:show, :edit, :new, :destroy, :update, :create]
  before_action :set_genmut, only: [:new, :edit, :update, :create]
  # GET /stats
  # GET /stats.json
  def index
     
    if params[:search]
      @stats = Stat.search(params[:search]).paginate(:per_page => 3, :page => params[:page])
    else
      @stats = Stat.all.paginate(:per_page => 3, :page => params[:page])
    end
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @stat = Stat.new
    @n = params[:new] #gene.id 
    @nn = params[:newm] #mutation.id
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(stat_params)

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render :show, status: :created, location: @stat }
      else
        format.html { render :new }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    respond_to do |format|
      if @stat.update(stat_params)
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @stat }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to stas_url, notice: 'Association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:n_studies, :info, :gene_id, :mutation_id)
    end

    def set_genmut
      @genes = Gene.all
      @mutations = Mutation.all
    end
end
