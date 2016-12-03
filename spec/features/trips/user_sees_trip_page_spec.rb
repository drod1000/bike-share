require_relative '../../spec_helper'


describe "trips" do
  describe "/trips" do
    it "should only show the first thirty trips" do
      count = 0
      id = 0
      duration = 100
      day = 0
      35.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})

      end
      visit("/trips")

      expect(Trip.all.count).to eq (35)
      expect(page).to have_content ("Number of Trips")
      find("th",text: 'Number of Trips').should have_no_content(31)
      expect(page).to have_content ("30")
    end

    it "should present the first thirty trips organized by date" do
      count = 0
      id = 0
      duration = 100
      day = 0
      35.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})
      end
      visit("/trips")

      expect(page).to_not have_content("Trip Id: 31")
      # save_and_open_page
      expect(Trip.first.start_date).to eq("8/1/2013")
      thirtieth_trip = Trip.find(30)
      expect(thirtieth_trip.start_date).to eq("8/59/2013")
    end

    it "clicking button 2 should take the user to the second page of trips" do
      count = 0
      duration = 100
      id = 0
      day = 0
      60.times do |create_trips|
        Trip.create({id: count += 1, duration: duration += 10, start_date: "8/#{day += 1}/2013", start_station_name: "San Jose", start_station_id: id += 1, end_date: "8/#{day += 1}/2013", end_station_name: "San Jose", end_station_id: id += 1, bike_id: 1, subscription_type: "Subscriber", zip_code: 80212})

      end
      visit("/trips")
      click_link_or_button("2")
      # expect(page).to have_content("Trip Id: 40")
      expect(Trip.first.start_date).to eq("8/1/2013")
      thirtieth_trip = Trip.find(30)
      expect(thirtieth_trip.start_date).to eq("8/59/2013")
    end

    it "should also be able to delete a trip" do
      Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")
      visit("/trips")
      # save_and_open_page
      fill_in("insert_id",with: 4069)
      click_on("delete_trip")
    end

    describe '/trips/:id' do
      it "should show one trip" do

        trip = Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")
        visit("/trips/4069")
        expect(page).to have_content("#{trip.id}")
        expect(page).to have_content("#{trip.duration}")
        expect(page).to have_content("#{trip.start_date}")
        expect(page).to have_content("#{trip.start_station_name}")
        expect(page).to have_content("#{trip.start_station_id}")
        expect(page).to have_content("#{trip.end_date}")
        expect(page).to have_content("#{trip.end_station_name}")
        expect(page).to have_content("#{trip.end_station_id}")
        expect(page).to have_content("#{trip.bike_id}")
        expect(page).to have_content("#{trip.subscription_type}")
        expect(page).to have_content("#{trip.zip_code}")
      end
    end

    describe '/trips/new' do
      it "should create a new trip" do
        visit("/trips/new")

        expect(page).to have_content("Create a New Trip")
        fill_in("duration", with: "100")
        fill_in("start_date", with: "12/03/2016")
        fill_in("start_station_name", with: "Union Station")
        fill_in("start_station_id", with: "1111")
        fill_in("end_date", with: "12/04/2016")
        fill_in("end_station_name", with: "Auraria")
        fill_in("end_station_id", with: "100")
        fill_in("bike_id", with: "12")
        fill_in("subscription_type", with: "Subscriber")
        fill_in("zip_code", with: "80212")
        click_on("submit_trip")

        expect(Trip.first.id).to eq(1)
        expect(Trip.first.duration).to eq(100)
        expect(Trip.first.start_date).to eq("12/03/2016")
        expect(Trip.first.start_station_id).to eq(1111)
        expect(Trip.first.start_station_name).to eq('Union Station')
        expect(Trip.first.end_date).to eq("12/04/2016")
        expect(Trip.first.end_station_name).to eq("Auraria")
        expect(Trip.first.end_station_id).to eq(100)
        expect(Trip.first.bike_id).to eq(12)
        expect(Trip.first.subscription_type).to eq("Subscriber")
        expect(Trip.first.zip_code).to eq(80212)

        expect(current_path).to eql('/trips')
      end
    end

    describe '/trips/edit' do
      it "should create a new trip" do
        Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")

        visit("/trips/#{Trip.first.id}/edit")

        expect(page).to have_content("Update")
        fill_in("duration", with: "100")
        fill_in("start_date", with: "12/03/2016")
        fill_in("start_station_name", with: "Union Station")
        fill_in("start_station_id", with: "1111")
        fill_in("end_date", with: "12/04/2016")
        fill_in("end_station_name", with: "Auraria")
        fill_in("end_station_id", with: "100")
        fill_in("bike_id", with: "12")
        fill_in("subscription_type", with: "Subscriber")
        fill_in("zip_code", with: "80212")
        click_on("submit_trip")

        expect(Trip.first.id).to eq(4069)
        expect(Trip.first.duration).to eq(100)
        expect(Trip.first.start_date).to eq("12/03/2016")
        expect(Trip.first.start_station_id).to eq(1111)
        expect(Trip.first.start_station_name).to eq('Union Station')
        expect(Trip.first.end_date).to eq("12/04/2016")
        expect(Trip.first.end_station_name).to eq("Auraria")
        expect(Trip.first.end_station_id).to eq(100)
        expect(Trip.first.bike_id).to eq(12)
        expect(Trip.first.subscription_type).to eq("Subscriber")
        expect(Trip.first.zip_code).to eq(80212)

        expect(current_path).to eql('/trips/4069')
      end

      it "should also be able to delete a trip" do
        Trip.create(id: 4069, duration: 174, start_date: "8/29/2013 9:08", start_station_name: "2nd at South Park", start_station_id: 64, end_date: "8/29/2013 9:11", end_station_name: "2nd at South Park", end_station_id: 64, bike_id: 288, subscription_type: "Subscriber", zip_code: 94114, created_at: "2016-12-02 23:59:08", updated_at: "2016-12-02 23:59:08")

        visit("/trips/#{Trip.first.id}/edit")

        click_on("delete_trip")
      end
    end

  end
end
