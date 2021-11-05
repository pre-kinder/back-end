class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.references :classroom, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone_number
      t.string :google_image_url
      t.string :google_id

      t.timestamps
    end
  end
end
