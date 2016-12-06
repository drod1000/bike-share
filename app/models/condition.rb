class Condition < ActiveRecord::Base
  validates :date, :max_temperature_f, :mean_temperature_f, :min_temperature_f,
            :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph,
            :precipitation_inches, presence: true

  def self.max_temperature_range(base_temp)
    where(max_temperature_f: base_temp...(base_temp + 10)).ids
  end

  def self.precipitation_in_half_inch_increments(precipitation)
    where(precipitation_inches: precipitation...(precipitation + 0.5)).ids
  end
end
