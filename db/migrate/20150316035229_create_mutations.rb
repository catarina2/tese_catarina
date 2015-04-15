class CreateMutations < ActiveRecord::Migration
  def change
    create_table :mutations do |t|
      t.string :nucleotide
      t.string :aminoacid
      t.string :hgvs

      t.timestamps null: false
    end
  end
end
