require_relative '../spec_helper'

describe 'when a user visits /dashboard' do
  it "they can see all dashboards" do
    Station.create(id: 1, name: "Station 1", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(id: 2, name: "Station 2", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Station.create(id: 3, name: "Station 3", dock_count: 10, city: "Denver", installation_date: "11/5/2016")
    Trip.create(id: 1, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 2, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 3, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 55555)
    Trip.create(id: 4, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 1, end_date:"2013-08-06 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 55555)
    Trip.create(id: 5, duration: 174, start_date: "2013-08-29 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 6, duration: 174, start_date: "2000-01-01 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 7, duration: 174, start_date: "2000-01-01 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 8, duration: 174, start_date: "2002-02-02 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Trip.create(id: 9, duration: 174, start_date: "2002-02-02 00:00:00 UTC", start_station_name: "2nd at South Park", start_station_id: 3, end_date:"2013-09-01 00:00:00 UTC", end_station_name: "2nd at South Park", end_station_id: 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 94114)
    Condition.create(date: '2000-01-01', precipitation_inches: 0.1, max_temperature_f: 95, min_temperature_f: 20,
    mean_temperature_f: 35, mean_visibility_miles: 5,
    mean_wind_speed_mph: 17, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2000-02-02', precipitation_inches: 0.2, max_temperature_f: 85, min_temperature_f: 20,
    mean_temperature_f: 3, mean_visibility_miles: 6, mean_wind_speed_mph: 3, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 1.2, max_temperature_f: 45, min_temperature_f: 20,
    mean_temperature_f: 35, mean_visibility_miles: 10, mean_wind_speed_mph: 12, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 0.3, max_temperature_f: 55, min_temperature_f: 20,  mean_temperature_f: 35, mean_visibility_miles: 12, mean_wind_speed_mph: 7, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 0.8, max_temperature_f: 55, min_temperature_f: 20,  mean_temperature_f: 35, mean_visibility_miles: 5, mean_wind_speed_mph: 2, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 0.5, max_temperature_f: 65, min_temperature_f: 20,  mean_temperature_f: 35, mean_visibility_miles: 11, mean_wind_speed_mph: 16, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 0.5, max_temperature_f: 75, min_temperature_f: 20,  mean_temperature_f: 35, mean_visibility_miles: 13, mean_wind_speed_mph: 20, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2013-08-29', precipitation_inches: 0.5, max_temperature_f: 75, min_temperature_f: 20,  mean_temperature_f: 35, mean_visibility_miles: 6, mean_wind_speed_mph: 8, mean_humidity: 20,
    zip_code: 94107)
    Condition.create(date: '2000-01-01', precipitation_inches: 0.1, max_temperature_f: 95, min_temperature_f: 20,
    mean_temperature_f: 35, mean_visibility_miles: 9, mean_wind_speed_mph: 21, mean_humidity: 20,
    zip_code: 94107)

    visit('/dashboard')

    expect(page).to have_content("Open Station Dashboard")
    expect(page).to have_content("Open Trip Dashboard")
    expect(page).to have_content("Open Weather Dashboard")

    click_on("Open Station Dashboard")
    expect(page).to have_content("Station Data")

    click_on("Open Trip Dashboard")
    expect(page).to have_content("Station Data")

    click_on("Open Weather Dashboard")
    expect(page).to have_content("Station Data")
  end
end
