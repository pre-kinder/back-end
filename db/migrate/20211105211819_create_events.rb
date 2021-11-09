class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :classroom, foreign_key: true
      t.string :title
      t.text :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
