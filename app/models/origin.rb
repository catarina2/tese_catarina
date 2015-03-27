class Origin < ActiveRecord::Base
	has_many :isolateds

	def self.search (search) 
      where("origin_t like ? OR lab_name like ?", "%#{search}%", "%#{search}%")
    end
end
