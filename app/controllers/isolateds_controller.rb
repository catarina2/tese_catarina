class IsolatedsController < ApplicationController
  before_action :set_isolated, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:show, :edit, :new, :destroy, :update, :create]
  before_action :set_orgorig, only: [:new, :edit, :update, :create]
  # GET /isolateds
  # GET /isolateds.json
  def index
    if params[:search]
      @isolateds = Isolated.search(params[:search]).order(:name, :disease).paginate(:per_page => 3, :page => params[:page])
    else
      @isolateds = Isolated.all.order(:name, :disease).paginate(:per_page => 3, :page => params[:page])
    end
  end

  # GET /isolateds/1
  # GET /isolateds/1.json
  def show
  end

  # GET /isolateds/new
  def new
    @isolated = Isolated.new
    @n = params[:newi] #isolated.id
  end

  # GET /isolateds/1/edit
  def edit
  end

  # POST /isolateds
  # POST /isolateds.json
  def create
    @isolated = Isolated.new(isolated_params)

    respond_to do |format|
      if @isolated.save
        format.html { redirect_to @isolated, notice: 'Isolated was successfully created.' }
        format.json { render :show, status: :created, location: @isolated }
      else
        format.html { render :new }
        format.json { render json: @isolated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /isolateds/1
  # PATCH/PUT /isolateds/1.json
  def update
    respond_to do |format|
      if @isolated.update(isolated_params)
        format.html { redirect_to @isolated, notice: 'Isolated was successfully updated.' }
        format.json { render :show, status: :ok, location: @isolated }
      else
        format.html { render :edit }
        format.json { render json: @isolated.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /isolateds/1
  # DELETE /isolateds/1.json
  def destroy
    @isolated.destroy
    respond_to do |format|
      format.html { redirect_to isolateds_url, notice: 'Isolated was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_isolated
      @isolated = Isolated.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isolated_params
      params.require(:isolated).permit(:name, :disease, :n_samples, :origin_id, :organism_id)
    end

    def set_orgorig
        @origins = Origin.all
        @organisms = Organism.all
    end
end
