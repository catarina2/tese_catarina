class ChangeReference < ActiveRecord::Migration
  def change
  	change_column :drugs, :reference, :text
  	change_column :genes, :reference, :text
  end
end
