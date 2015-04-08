class Publication < ActiveRecord::Base
	has_many :mutpubs, :dependent => :destroy
	has_many :mutations, :through => :mutpubs

	validates :author, :title, :date, :journal,  presence: true
	validates :author, length: { maximum: 30}
	validates :title, length: { maximum: 100}, uniqueness: true
	validates :journal, length: { maximum: 100}

	def self.search (search) 
      where("title like ? OR author like ? OR date like ? OR journal like ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
