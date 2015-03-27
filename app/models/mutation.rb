class Mutation < ActiveRecord::Base
	has_many :stats, :dependent => :destroy
	has_many :genes, :through => :stats
	has_many :mutpubs, :dependent => :destroy
	has_many :publications, :through => :mutpubs

	def self.search (search) 
      where("nucleotide like ? OR aminoacid like ?", "%#{search}%", "%#{search}%")
    end
end
