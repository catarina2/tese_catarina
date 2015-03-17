class Isolated < ActiveRecord::Base
  belongs_to :origin
  belongs_to :organism
  has_many :genes
  has_many :resists
  has_many :drugs, :through => :resists
end
