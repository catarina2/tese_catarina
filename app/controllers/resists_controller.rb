class ResistsController < ApplicationController
  before_action :set_resist, only: [:show, :edit, :update, :destroy]

  # GET /resists
  # GET /resists.json
  def index
    @resists = Resist.all
  end

  # GET /resists/1
  # GET /resists/1.json
  def show
  end

  # GET /resists/new
  def new
    @resist = Resist.new
    @drugs = Drug.all
    @isolateds = Isolated.all
  end

  # GET /resists/1/edit
  def edit
    @drugs = Drug.all
    @isolateds = Isolated.all
  end

  # POST /resists
  # POST /resists.json
  def create
    @resist = Resist.new(resist_params)

    respond_to do |format|
      if @resist.save
        format.html { redirect_to @resist, notice: 'Resist was successfully created.' }
        format.json { render :show, status: :created, location: @resist }
      else
        format.html { render :new }
        format.json { render json: @resist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resists/1
  # PATCH/PUT /resists/1.json
  def update
    respond_to do |format|
      if @resist.update(resist_params)
        format.html { redirect_to @resist, notice: 'Resist was successfully updated.' }
        format.json { render :show, status: :ok, location: @resist }
      else
        format.html { render :edit }
        format.json { render json: @resist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resists/1
  # DELETE /resists/1.json
  def destroy
    @resist.destroy
    respond_to do |format|
      format.html { redirect_to resists_url, notice: 'Resist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resist
      @resist = Resist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resist_params
      params.require(:resist).permit(:reference, :mic, :drug_id, :isolated_id)
    end
end
