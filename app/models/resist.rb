class Resist < ActiveRecord::Base
  belongs_to :drug
  belongs_to :isolated

  validates :mic,  presence: true
  validates :mic, uniqueness: true, numericality: { only_integer: true}


  def self.search (search)
     joins(:drug).joins(:isolated).where("drugs.name like ? OR isolateds.name like ? OR drugs.reference like ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
