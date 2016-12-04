class RenameColumnEvent < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :event, :events
  end
end
