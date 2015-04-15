class Isolated < ActiveRecord::Base
  belongs_to :origin
  belongs_to :organism
  has_many :genes,	:dependent => :destroy
  has_many :resists, :dependent => :destroy
  has_many :drugs, :through => :resists
  accepts_nested_attributes_for :genes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :resists, :reject_if => lambda { |a| a[:mic].blank? } , :allow_destroy => true

  validates :name, :disease,  presence: true
  validates :n_samples, numericality: { only_integer: true}
  validates :name, length: { maximum: 30}, uniqueness: true
  validates :disease, length: { maximum: 100}


  def self.search (search) 
      where("name like ? OR disease like ?", "%#{search}%", "%#{search}%")
  end

 
end
