class Drug < ActiveRecord::Base
	has_many :resists
	has_many :isolateds, :through => :resists
end
