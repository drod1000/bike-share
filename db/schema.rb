# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161204222159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string   "date"
    t.string   "max_temperature_f"
    t.string   "mean_temperature_f"
    t.string   "min_temperature_f"
    t.string   "mean_humidity"
    t.string   "mean_visibility"
    t.string   "mean_wind_speed_mph"
    t.string   "precipitation_inches"
    t.string   "max_dew_point_f"
    t.string   "mean_dew_point_f"
    t.string   "min_dew_point_f"
    t.string   "max_humidity"
    t.string   "min_humidity"
    t.string   "max_sea_level_pressure_inches"
    t.string   "mean_sea_level_pressure_inches"
    t.string   "min_sea_level_pressure_inches"
    t.string   "max_visibility_miles"
    t.string   "min_visibility_miles"
    t.string   "max_wind_speed_mph"
    t.string   "max_gust_speed_mph"
    t.string   "cloud_cover"
    t.string   "events"
    t.string   "wind_dir_degrees"
    t.string   "zip_code"
    t.string   "mean_visibility_miles"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.integer  "dock_count"
    t.string   "city"
    t.string   "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trips", force: :cascade do |t|
    t.float    "duration"
    t.string   "start_date"
    t.string   "start_station_name"
    t.float    "start_station_id"
    t.string   "end_date"
    t.string   "end_station_name"
    t.float    "end_station_id"
    t.float    "bike_id"
    t.string   "subscription_type"
    t.float    "zip_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
