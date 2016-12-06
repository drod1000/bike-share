class Condition < ActiveRecord::Base
  validates :date, :max_temperature_f, :mean_temperature_f, :min_temperature_f,
            :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph,
            :precipitation_inches, presence: true

  def self.max_temperature_range(temp_range)
    if temp_range == "0s"
      Condition.where(max_temperature_f: 0...10).ids
    elsif temp_range == "10s"
      Condition.where(max_temperature_f: 10...20).ids
    elsif temp_range == "20s"
      Condition.where(max_temperature_f: 20...30).ids
    elsif temp_range == "30s"
      Condition.where(max_temperature_f: 30...40).ids
    elsif temp_range == "40s"
      Condition.where(max_temperature_f: 40...50).ids
    elsif temp_range == "50s"
      Condition.where(max_temperature_f: 50...60).ids
    elsif temp_range == "60s"
      Condition.where(max_temperature_f: 60...70).ids
    elsif temp_range == "70s"
      Condition.where(max_temperature_f: 70...80).ids
    elsif temp_range == "80s"
      Condition.where(max_temperature_f: 80...90).ids
    elsif temp_range == "90s"
      Condition.where(max_temperature_f: 90...100).ids
    elsif temp_range == "100s"
      Condition.where(max_temperature_f: 100...110).ids
    elsif temp_range == "110s"
      Condition.where(max_temperature_f: 110...120).ids
    end
  end
end
