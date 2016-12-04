class ChangeAllTypesToStrings < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :max_temperature, :string
    change_column :conditions, :mean_temperature, :string
    change_column :conditions, :min_temperature, :string
    change_column :conditions, :mean_humidity, :string
    change_column :conditions, :mean_visibility, :string
    change_column :conditions, :mean_wind_speed, :string
    change_column :conditions, :precipitation, :string
  end
end
