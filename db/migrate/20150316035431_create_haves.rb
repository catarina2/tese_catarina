class CreateHaves < ActiveRecord::Migration
  def change
    create_table :haves do |t|
      t.references :mutation, index: true
      t.references :publication, index: true

      t.timestamps null: false
    end
    add_foreign_key :haves, :mutations
    add_foreign_key :haves, :publications
  end
end
