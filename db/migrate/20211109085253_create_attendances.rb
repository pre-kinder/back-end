class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date
      t.integer :status
      t.references :classroom, foreign_key: true
      t.references :child, foreign_key: true
    end
  end
end
