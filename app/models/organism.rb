class Organism < ActiveRecord::Base
	has_many :isolateds, :dependent => :destroy

	validates :tax_org, presence: true, uniqueness: true, numericality: { only_integer: true}
	validates :name, presence: true, length: { maximum: 30}

	def self.search (search) 
      where("name like ? OR tax_org like ?", "%#{search}%", "%#{search}%")
    end
end
