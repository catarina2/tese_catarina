class Drug < ActiveRecord::Base
	has_many :resists, :dependent => :destroy
	has_many :isolateds, :through => :resists

	validates :name, :reference, :atc,  presence: true
	validates :reference, uniqueness: true, numericality: { only_integer: true}
	validates :name, length: { maximum: 30}
	
	def self.search (search) 
      where("name like ? OR reference like ?", "%#{search}%", "%#{search}%")
    end
end
