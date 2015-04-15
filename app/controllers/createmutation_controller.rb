class CreatemutationController < ApplicationController
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
    @mutation = Mutation.new(mutation_params)
    respond_to do |format|
    if @mutation.save
        format.html { redirect_to new_dashboard_path, notice: 'Mutation was successfully created.' }
        format.json { render :show, status: :created, location: new_dashboard_path }
      else
        format.html { render "/createmutation/new" }
        format.json { render json: @mutation.errors, status: :unprocessable_entity }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutation_params
      params.require(:mutation).permit(:nucleotide, :aminoacid, :hgvs, publications_attributes: [
                                                                                                  :author,
                                                                                                  :title,
                                                                                                  :date,
                                                                                                  :journal])
    end
end
