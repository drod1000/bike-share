class FixColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :max_temperature, :max_temperature_f
    rename_column :conditions, :mean_temperature, :mean_temperature_f
    rename_column :conditions, :min_temperature, :min_temperature_f
  end
end
