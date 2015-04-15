class Mutation < ActiveRecord::Base
	has_many :stats, :dependent => :destroy
	has_many :genes, :through => :stats
	has_many :mutpubs, :dependent => :destroy
	has_many :publications, :through => :mutpubs

	accepts_nested_attributes_for :mutpubs, :allow_destroy => true
	accepts_nested_attributes_for :publications, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

	validates :nucleotide, :aminoacid,  presence: true, uniqueness: true
	
	def self.search (search) 
      where("nucleotide like ? OR aminoacid like ?", "%#{search}%", "%#{search}%")
    end

    def allmut
    	"Nucleotide: #{nucleotide} => Aminoacid: #{aminoacid}"
    end
end
