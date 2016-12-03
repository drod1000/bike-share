class AddColumnsForAllDataInFile < ActiveRecord::Migration[5.0]
  def change
    add_column :conditions, :max_dew_point, :string
    add_column :conditions, :mean_dew_point, :string
    add_column :conditions, :min_dew_point, :string
    add_column :conditions, :max_humidity, :string
    add_column :conditions, :min_humidity, :string
    add_column :conditions, :max_sea_level_pressure_inches, :string
    add_column :conditions, :mean_sea_level_pressure_inches, :string
    add_column :conditions, :min_sea_level_pressure_inches, :string
    add_column :conditions, :max_visibility_miles, :string
    add_column :conditions, :min_visibility_miles, :string
    add_column :conditions, :max_wind_Speed_mph, :string
    add_column :conditions, :max_gust_speed_mph, :string
    add_column :conditions, :cloud_cover, :string
    add_column :conditions, :event, :string
    add_column :conditions, :wind_dir_degrees, :string
    add_column :conditions, :zip_code, :string

    rename_column :conditions, :precipitation, :precipitation_inches
  end
end
