require 'pry'
class Station < ActiveRecord::Base
  validates :name,
            :dock_count,
            :city,
            :installation_date, presence: true
<<<<<<< HEAD
  validates :name, uniqueness: true

  has_many :start_trips, class_name: :Trip, foreign_key: :start_station_id
  has_many :end_trips, class_name: :Trip, foreign_key: :end_station_id
=======
  has_many :start_trips, :class_name => 'Trip', :foreign_key => :start_station_id
  has_many :end_trips, :class_name => 'Trip', :foreign_key => :end_station_id

  def self.total_stations
    self.count
  end

  def self.average_number_of_bikes
    self.average(:dock_count)
  end

  def self.most_bikes_available
    self.maximum(:dock_count)
  end

  def self.with_most_bikes
    self.find_by(dock_count: most_bikes_available)
  end

  def self.fewest_bikes_available
    self.minimum(:dock_count)
  end

  def self.with_fewest_bikes
    self.find_by(dock_count: fewest_bikes_available)
  end

  def self.newest_station
    self.maximum(:installation_date)
  end



>>>>>>> a38825cb05700149711e9776afdc4ef42839a364
end
