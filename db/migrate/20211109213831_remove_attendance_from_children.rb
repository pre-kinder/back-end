class RemoveAttendanceFromChildren < ActiveRecord::Migration[5.2]
  def up
    remove_column :children, :attendance_status
  end

  def down
    add_column :children, :attendance_status, :integer
  end
end
