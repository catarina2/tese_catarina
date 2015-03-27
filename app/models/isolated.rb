class Isolated < ActiveRecord::Base
  belongs_to :origin
  belongs_to :organism
  has_many :genes,	:dependent => :destroy
  has_many :resists, :dependent => :destroy
  has_many :drugs, :through => :resists

  accepts_nested_attributes_for :genes

  def self.search (search) 
      where("name like ? OR disease like ?", "%#{search}%", "%#{search}%")
   end
 
end
