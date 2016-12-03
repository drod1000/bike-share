class Station < ActiveRecord::Base
  validates :name, :dock_count, :city, :installation_date, presence: true
  validates :name, uniqueness: true
  ##Should name be unique?
end
