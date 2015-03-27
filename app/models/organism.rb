class Organism < ActiveRecord::Base
	has_many :isolateds, :dependent => :destroy

	def self.search (search) 
      where("name like ? OR tax_org like ?", "%#{search}%", "%#{search}%")
    end
end
