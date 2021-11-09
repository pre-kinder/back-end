class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.references :parent, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
