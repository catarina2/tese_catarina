class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :origin_t
      t.string :lab_name

      t.timestamps null: false
    end
  end
end
