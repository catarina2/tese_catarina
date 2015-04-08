class Stat < ActiveRecord::Base
  belongs_to :gene
  belongs_to :mutation

  validates :n_studies, numericality: { only_integer: true}
  validates :info, length: { maximum: 1000}

  def self.search (search)
      joins(:gene).joins(:mutation).where("name like ? OR nucleotide like ? OR aminoacid like ? ", "%#{search}%", "%#{search}%", "%#{search}%")

  end

end
