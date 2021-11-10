class AddNotestoAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :notes, :string
  end
end
