class Station < ActiveRecord::Base
  validates :name,
            :dock_count,
            :city,
            :installation_date, presence: true
  validates :name, uniqueness: true

  has_many :start_trips, :class_name => 'Trip', :foreign_key => :start_station_id
  has_many :end_trips, :class_name => 'Trip', :foreign_key => :end_station_id

end
