class CreateOrganisms < ActiveRecord::Migration
  def change
    create_table :organisms do |t|
      t.integer :tax_org
      t.string :name

      t.timestamps null: false
    end
  end
end
