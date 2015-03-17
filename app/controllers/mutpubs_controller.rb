class MutpubsController < ApplicationController
  before_action :set_mutpub, only: [:show, :edit, :update, :destroy]

  # GET /mutpubs
  # GET /mutpubs.json
  def index
    @mutpubs = Mutpub.all
  end

  # GET /mutpubs/1
  # GET /mutpubs/1.json
  def show
  end

  # GET /mutpubs/new
  def new
    @mutpub = Mutpub.new
    @mutations = Mutation.all
    @publications = Publication.all
  end

  # GET /mutpubs/1/edit
  def edit
    @mutations = Mutation.all
    @publications = Publication.all
  end

  # POST /mutpubs
  # POST /mutpubs.json
  def create
    @mutpub = Mutpub.new(mutpub_params)

    respond_to do |format|
      if @mutpub.save
        format.html { redirect_to @mutpub, notice: 'Mutpub was successfully created.' }
        format.json { render :show, status: :created, location: @mutpub }
      else
        format.html { render :new }
        format.json { render json: @mutpub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mutpubs/1
  # PATCH/PUT /mutpubs/1.json
  def update
    respond_to do |format|
      if @mutpub.update(mutpub_params)
        format.html { redirect_to @mutpub, notice: 'Mutpub was successfully updated.' }
        format.json { render :show, status: :ok, location: @mutpub }
      else
        format.html { render :edit }
        format.json { render json: @mutpub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mutpubs/1
  # DELETE /mutpubs/1.json
  def destroy
    @mutpub.destroy
    respond_to do |format|
      format.html { redirect_to mutpubs_url, notice: 'Mutpub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutpub
      @mutpub = Mutpub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutpub_params
      params.require(:mutpub).permit(:mutation_id, :publication_id)
    end
end
