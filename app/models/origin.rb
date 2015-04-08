class Origin < ActiveRecord::Base
	has_many :isolateds

	validates :lab_name, length: { maximum: 100}, presence: true

	def self.search (search) 
      where("origin_t like ? OR lab_name like ?", "%#{search}%", "%#{search}%")
    end

    def all
    	"Laboratory: #{lab_name} => Type: #{origin_t}"
    end
end
