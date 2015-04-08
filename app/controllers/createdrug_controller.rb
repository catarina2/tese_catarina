class CreatedrugController < ApplicationController
before_filter :authorize


  def new
    @isolated = Isolated.new
    @drug = Drug.new
    @mutation = Mutation.new
    @organism = Organism.new
    @origin = Origin.new
   # @isolated.genes.build
  end
  # POST /dashboards
  # POST /dashboards.json
  def create
    @isolated = Isolated.new
    @drug = Drug.new
    @mutation = Mutation.new
    @organism = Organism.new
    @origin = Origin.new
    @gene = Gene.new
    @origins = Origin.all
    @organisms = Organism.all
    @mutations = Mutation.all
    @drugs = Drug.all
    @publications = Publication.all
    @genes = Gene.all
    @drug = Drug.new(drug_params)
    respond_to do |format|
    if @drug.save
        format.html { redirect_to new_dashboard_path, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: new_dashboard_path }
      else
        format.html { render "/createdrug/new" }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    def drug_params
      params.require(:drug).permit(:name, :reference, :atc, :drugbank)
    end
end
