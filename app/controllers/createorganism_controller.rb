class CreateorganismController < ApplicationController
before_filter :authorize

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
    @organism = Organism.new(organism_params)
    respond_to do |format|
    if @organism.save
        format.html { redirect_to new_dashboard_path, notice: 'Organism was successfully created.' }
        format.json { render :show, status: :created, location: new_dashboard_path }
      else
        format.html { render "/createorganism/new" }
        format.json { render json: @organism.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    def organism_params
      params.require(:organism).permit(:name, :tax_org)
    end
end
