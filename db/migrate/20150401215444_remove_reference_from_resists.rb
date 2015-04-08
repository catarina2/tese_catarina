lass RemoveReferenceFromResists < ActiveRecord::Migration
  def change
    remove_column :resists, :reference, :string
  end
end
