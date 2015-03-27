class Publication < ActiveRecord::Base
	has_many :mutpubs, :dependent => :destroy
	has_many :mutations, :through => :mutpubs

	def self.search (search) 
      where("title like ? OR author like ? OR date like ? OR journal like ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
