require_relative '../spec_helper'

describe "Conditon" do
  it "finds conditions that occur in max temperature 10 degree ranges" do
    Condition.create(date: '2000-01-01', precipitation_inches: 5,
                     max_temperature_f: 52, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)
    Condition.create(date: '2000-02-02', precipitation_inches: 5,
                     max_temperature_f: 59, min_temperature_f: 20,
                     mean_temperature_f: 3, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)
    Condition.create(date: '2000-03-03', precipitation_inches: 5,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)

    expect(Condition.max_temperature_range(50)).to eq([1,2])
    expect(Condition.max_temperature_range(40)).to eq([3])
  end

  it "find conditions that occure in half inch precipitation range" do
    Condition.create(date: '2000-01-01', precipitation_inches: 0.0,
                     max_temperature_f: 52, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)
    Condition.create(date: '2000-02-02', precipitation_inches: 0.4,
                     max_temperature_f: 59, min_temperature_f: 20,
                     mean_temperature_f: 3, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)
    Condition.create(date: '2000-03-03', precipitation_inches: 0.5,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)
    Condition.create(date: '2000-03-03', precipitation_inches: 0.8,
                     max_temperature_f: 40, min_temperature_f: 20,
                     mean_temperature_f: 35, mean_visibility_miles: 10,
                     mean_wind_speed_mph: 20, mean_humidity: 20)

    expect(Condition.precipitation_in_half_inch_increments(0.0)).to eq([1,2])
    expect(Condition.precipitation_in_half_inch_increments(0.5)).to eq([3,4])

  end


  describe "validations" do
    it "validates presence of date" do
      invalid_condition = Condition.new(precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of max_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of precipitation" do
          invalid_condition = Condition.new(date: '12/01/2000',
                                      max_temperature_f: 50, min_temperature_f: 20,
                                      mean_temperature_f: 35, mean_visibility_miles: 10,
                                      mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of min temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)
      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean visibility" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35,
                                  mean_wind_speed_mph: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean_wind_speed" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates presence of mean humidity" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation_inches: 5,
                                  max_temperature_f: 50, min_temperature_f: 20,
                                  mean_temperature_f: 35, mean_visibility_miles: 10,
                                  mean_wind_speed_mph: 20)

      expect(invalid_condition).to_not be_valid
    end
  end
end
