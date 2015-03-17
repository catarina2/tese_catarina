class Have < ActiveRecord::Base
  belongs_to :mutation
  belongs_to :publication
end
