require_relative "../spec_helper"


describe "trip/paths" do
  describe "/trips" do
    it "should only show the first thirty trips" do
      count = 0
      35.times do |create_trips|
        Trip.create(id: count += 1, duration: 1, start_date: "8/29/2013 9:08")
      end

      expect(Trip.all.count).to eq (35)
      
    end

    it "should present the first thirty trips organized by date" do

    end

  end
end
