require_relative '../spec_helper'

describe "Conditon" do
  describe "validations" do
    it "validates prescence of date" do
      invalid_condition = Condition.new(precipitation: 5,
                                  max_temperature: 50, min_temperature: 20,
                                  mean_temperature: 35, mean_visibility: 10,
                                  mean_wind_speed: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of max_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  min_temperature: 20,
                                  mean_temperature: 35, mean_visibility: 10,
                                  mean_wind_speed: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of precipitation" do
          invalid_condition = Condition.new(date: '12/01/2000',
                                      max_temperature: 50, min_temperature: 20,
                                      mean_temperature: 35, mean_visibility: 10,
                                      mean_wind_speed: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of min temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  max_temperature: 50,
                                  mean_temperature: 35, mean_visibility: 10,
                                  mean_wind_speed: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of mean_temperature" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  max_temperature: 50, min_temperature: 20,
                                  mean_visibility: 10,
                                  mean_wind_speed: 20, mean_humidity: 20)
      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of mean visibility" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  max_temperature: 50, min_temperature: 20,
                                  mean_temperature: 35,
                                  mean_wind_speed: 20, mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of mean_wind_speed" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  max_temperature: 50, min_temperature: 20,
                                  mean_temperature: 35, mean_visibility: 10,
                                  mean_humidity: 20)

      expect(invalid_condition).to_not be_valid
    end

    it "validates prescence of mean humidity" do
      invalid_condition = Condition.new(date: '12/01/2000', precipitation: 5,
                                  max_temperature: 50, min_temperature: 20,
                                  mean_temperature: 35, mean_visibility: 10,
                                  mean_wind_speed: 20)

      expect(invalid_condition).to_not be_valid
    end
  end
end
