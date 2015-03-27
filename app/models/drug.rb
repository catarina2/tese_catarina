class Drug < ActiveRecord::Base
	has_many :resists, :dependent => :destroy
	has_many :isolateds, :through => :resists

	
	def self.search (search) 
      where("name like ? OR reference like ?", "%#{search}%", "%#{search}%")
    end
end
