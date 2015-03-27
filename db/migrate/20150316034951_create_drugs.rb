class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.integer :reference
      t.string :name
      t.string :atc
      t.string :drugbank

      t.timestamps null: false
    end
  end
end
