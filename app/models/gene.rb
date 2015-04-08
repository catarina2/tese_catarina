class Gene < ActiveRecord::Base
  belongs_to :isolated
  has_many :stats, :dependent => :destroy
  has_many :mutations, :through => :stats

  accepts_nested_attributes_for :stats, :reject_if => lambda { |a| a[:info].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :mutations, :reject_if => lambda { |a| a[:nucleotide].blank? }, :allow_destroy => true

  validates :name, :reference, :sequence,  presence: true
  validates :reference, uniqueness: true, numericality: { only_integer: true}
  validates :name, length: { maximum: 30}
  
  def self.search (search) 
      where("name like ? OR reference like ? OR sequence like ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
