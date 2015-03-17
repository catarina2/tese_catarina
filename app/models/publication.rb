class Publication < ActiveRecord::Base
	has_many :haves
	has_many :mutations, :through => :haves
end
