class RenameColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :max_dew_point, :max_dew_point_f
    rename_column :conditions, :mean_dew_point, :mean_dew_point_f
    rename_column :conditions, :min_dew_point, :min_dew_point_f
  end
end
