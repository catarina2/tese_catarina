class Gene < ActiveRecord::Base
  belongs_to :isolated
  has_many :stats
  has_many :mutations, :through => :stats
end
