class RenameMeanWindSpeed < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :mean_wind_speed, :mean_wind_speed_mph
  end
end
