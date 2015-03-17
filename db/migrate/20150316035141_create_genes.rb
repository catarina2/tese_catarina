class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :name
      t.string :sequence
      t.integer :reference
      t.string :uniprot
      t.string :symbol
      t.references :isolated, index: true

      t.timestamps null: false
    end
    add_foreign_key :genes, :isolateds
  end
end
