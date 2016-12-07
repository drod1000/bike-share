require 'pry'
class Condition < ActiveRecord::Base
  validates :date,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :mean_humidity,
            :mean_visibility_miles,
            :mean_wind_speed_mph,
            :precipitation_inches,
            presence: true
  validates :zip_code, numericality: {equal_to: 94107}

  has_many :trips, primary_key: :date, foreign_key: :start_date
  attr_reader :average_temperature,
              :max_temperature,
              :min_temperature,
              :average_precipitation,
              :max_precipitation,
              :min_precipitation,
              :average_wind,
              :max_wind,
              :min_wind,
              :average_visibility,
              :max_visibilit,
              :min_visibility

  def self.trips_per_day
    Trip.group(:start_date).count
  end

  def self.max_temperature_range(base_temp)
    where(max_temperature_f: base_temp...(base_temp + 10))
  end

  def self.average_max_temp_trips(base_temp)
    found = []
    Condition.max_temperature_range(base_temp).find_each do |trip|
      found << Trip.where(start_date: trip.date).count
    end
    @average_temperature = found.reduce(:+) / found.count
    @max_temperature = found.max
    @min_temperature = found.min
  end

  def self.precipitation_in_half_inch_increments(precipitation)
    where(precipitation_inches: precipitation...(precipitation + 0.5))
  end

  def self.trips_in_precipitation_range(base_range)
    found = []
    Condition.precipitation_in_half_inch_increments(base_range).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    @average_precipitation = found.reduce(:+) / found.count
    @max_precipitation = found.max
    @min_precipitation = found.min
    binding.pry
  end

  def self.wind_speed_in_4_mph_chunks(base_speed)
    where(mean_wind_speed_mph: base_speed...(base_speed + 4))
  end

  def self.trips_in_wind_speed_range(base_speed)
    found = []
    Condition.wind_speed_in_4_mph_chunks(base_speed).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    @average_wind = found.reduce(:+) / found.count
    @max_wind = found.max
    @min_wind = found.min
  end

  def self.visibility_in_4_mile_range(base_visibility)
    where(mean_visibility_miles: base_visibility...(base_visibility + 4))
  end

  def trips_with_visibility_in_4_mile_range(base_visibility)
    found = []
    Condition.precipitation_in_half_inch_increments(base_range).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    @average_visibility = found.reduce(:+) / found.count
    @max_visibility = found.max
    @min_visibility = found.min
  end
end
