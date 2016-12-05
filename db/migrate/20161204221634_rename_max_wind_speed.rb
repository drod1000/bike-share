class RenameMaxWindSpeed < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :max_wind_Speed_mph, :max_wind_speed_mph
  end
end
