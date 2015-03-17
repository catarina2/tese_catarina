class Mutation < ActiveRecord::Base
	has_many :stats
	has_many :genes, :through => :stats
	has_many :haves
	has_many :publications, :through => :haves
end
