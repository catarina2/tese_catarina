class CreateIsolateds < ActiveRecord::Migration
  def change
    create_table :isolateds do |t|
      t.string :name
      t.string :disease
      t.integer :n_samples
      t.references :origin, index: true
      t.references :organism, index: true

      t.timestamps null: false
    end
    add_foreign_key :isolateds, :origins
    add_foreign_key :isolateds, :organisms
  end
end
