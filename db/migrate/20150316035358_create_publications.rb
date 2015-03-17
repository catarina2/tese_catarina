class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :author
      t.string :title
      t.date :date
      t.string :journal

      t.timestamps null: false
    end
  end
end
