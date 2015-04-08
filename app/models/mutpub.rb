class Mutpub < ActiveRecord::Base
  belongs_to :mutation
  belongs_to :publication


  def self.search (search)
      joins(:publication).joins(:mutation).where("title like ? OR nucleotide like ? OR aminoacid like ?", "%#{search}%", "%#{search}%", "%#{search}%")

  end
end
