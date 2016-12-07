class Trip < ActiveRecord::Base
  validates :duration,
            :start_date,
            :start_station_name,
            :start_station_id,
            :end_date,
            :end_station_name,
            :end_station_id,
            :bike_id,
            :subscription_type,
            :zip_code, presence: true

  belongs_to  :starting_station, class_name: :Station, foreign_key: :start_station_id
  belongs_to  :end_station, class_name: :Station, foreign_key: :end_station_id

  def self.average_duration
    average(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.most_popular_starting_station
    trip_uses = group(:start_station_id).count
    highest_use = group(:start_station_id).count.values.max
    station_id = trip_uses.key(highest_use)
    Station.find(station_id)
  end

  def self.most_popular_ending_station
    trip_uses = group(:end_station_id).count
    highest_use = group(:end_station_id).count.values.max
    station_id = trip_uses.key(highest_use)
    Station.find(station_id)
  end

  def self.month_by_month_breakdown_2013
    c = Calendar.new
    c.year_2013 = where('extract(year FROM start_date)= ?', 2013)
    x = c.year_2013.group("date_trunc('month', start_date)").count
    binding.pry
  end

  def self.month_by_month_breakdown_2014
    c.year_2014 = where('extract(year FROM start_date) = ?', 2014)
  end

  def self.month_by_month_breakdown_2015
    c.year_2015 = where('extract(year FROM start_date) = ?', 2015)
  end

  def self.total_bike_uses
    Trip.group(:bike_id).count
  end

  def self.most_ridden_bike
    bike_hash = total_bike_uses
    most_rides = bike_hash.values.max
    Struct.new("Bike", :id, :count)
    Struct::Bike.new(bike_hash.key(most_rides), most_rides)
  end

  def self.least_ridden_bike
    bike_hash = total_bike_uses
    least_rides = bike_hash.values.min
    Struct.new("Bike", :id, :count)
    Struct::Bike.new(bike_hash.key(least_rides), least_rides)
  end

  def self.users
    group(:subscription_type).count
  end

  def self.total_users(customers)
    customers.values.sum
  end

  def self.subscribers
    user = users
    total_subscribers = total_users(user)
    percentage = calculate_percentage(total_subscribers,user["Subscriber"])
    Struct.new("Subscribers", :total, :count, :percent)
    Struct::Subscribers.new(total_subscribers, user["Subscriber"],percentage)
  end

  def self.consumers
    user = users
    total_consumers = total_users(user)
    percentage = calculate_percentage(total_consumers,user["Consumer"])
    Struct.new("Consumers", :total, :count, :percent)
    Struct::Consumers.new(total_consumers, user["Consumer"],percentage)
  end

  def self.calculate_percentage(total,initial_value)
    (initial_value.to_f / total.to_f) * 100
  end

  def self.date_count
    group(:start_date).count
  end

  def self.date_with_the_most_amount_of_trips
    dates_sorted_by_count = date_count
    max_date = dates_sorted_by_count.values.max
    Struct.new("Date", :date, :count)
    Struct::Date.new(dates_sorted_by_count.key(max_date), max_date)
  end

  def self.date_with_the_least_amount_of_trips
    dates_sorted_by_count = date_count
    min_date = dates_sorted_by_count.values.min
    Struct.new("Date", :date, :count)
    Struct::Date.new(dates_sorted_by_count.key(min_date), min_date)
  end

end
