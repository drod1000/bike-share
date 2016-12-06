class Station < ActiveRecord::Base
  validates :name,
            :dock_count,
            :city,
            :installation_date, presence: true
  validates :name, uniqueness: true

  # has_many :trips, foreign_key: :start_station_id

end
