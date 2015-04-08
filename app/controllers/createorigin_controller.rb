class CreateoriginController < ApplicationController
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
    @origin = Origin.new(origin_params)
    respond_to do |format|
    if @origin.save
        format.html { redirect_to new_dashboard_path, notice: 'Origin was successfully created.' }
        format.json { render :show, status: :created, location: new_dashboard_path }
      else
        format.html { render "/createorigin/new" }
        format.json { render json: @origin.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    def origin_params
      params.require(:origin).permit(:origin_t, :lab_name)
    end
end