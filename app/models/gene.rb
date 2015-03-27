class Gene < ActiveRecord::Base
  belongs_to :isolated
  has_many :stats, :dependent => :destroy
  has_many :mutations, :through => :stats

  def self.search (search) 
      where("name like ? OR reference like ? OR sequence like ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
