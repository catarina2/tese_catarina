class CreateMutpubs < ActiveRecord::Migration
  def change
    create_table :mutpubs do |t|
      t.references :mutation, index: true
      t.references :publication, index: true

      t.timestamps null: false
    end
    add_foreign_key :mutpubs, :mutations
    add_foreign_key :mutpubs, :publications
  end
end
