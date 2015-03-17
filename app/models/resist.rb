class Resist < ActiveRecord::Base
  belongs_to :drug
  belongs_to :isolated
end
