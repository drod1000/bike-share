class UpdateColumnsTypesAllNeeded < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :city_id, :integer
    add_column :trips, :subscriber_id, :integer

 :max_temperature_f, :integer
 :mean_temperature_f, :integer
 :min_temperature_f, :integer
 :mean_humidity, :integer
 :mean_visibility, :integer
 :mean_wind_speed_mph, :integer
 :precipitation_inches, :integer
 :max_dew_point_f, :integer
 :mean_dew_point_f, :integer
 :min_dew_point_f, :integer
 :max_humidity, :integer
 :min_humidity, :integer
 :max_sea_level_pressure_inches, :integer
 :min_sea_level_pressure_inches, :integer
 :mean_sea_level_pressure_inches, :integer
 :max_visibility_miles, :integer
 :min_visibility_miles, :integer
 :max_gust_speed_mph, :integer
 :max_wind_speed_mph, :integer
 :cloud_cover, :integer
 :wind_dir_degrees, :integer
 :zip_code, :integer
 :mean_visibility_miles, :integer

  end
end
