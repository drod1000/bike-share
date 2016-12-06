class StationTrip < ActiveRecord::Base
  belongs_to :trips
  belongs_to :stations

end
