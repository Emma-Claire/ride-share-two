require_relative 'spec_helper'

describe "RideShare::Driver" do

  before do
    data = {
      id: 123,
      vin: "12345678901234567",
      name: "Zane Al"
    }
    @driver = RideShare::Driver.new(data)

  end

  describe "Driver#initialize" do

      it "Takes an ID, a name and a vin" do

        name = 'Zane Alexander'
        id = 123
        vin = '12345671234567890'

        @driver.must_respond_to :id
        @driver.id.must_equal id
        @driver.must_respond_to :name
        @driver.balance.must_equal name
        @driver.must_respond_to :vin
        @driver.date.must_equal vin
      end


    it "raises a Argumenterror if the VIN is not 17 characters in length" do
      data = {
        id: 123,
        vin: "badvin",
        name: "Zane Al"
      }

      proc {
        RideShare::Driver.new(data)
      }.must_raise ArgumentError
    end

  end

  describe "self.all" do

    it "returns a list of all drivers from the csv" do

    end

  end

  describe "self.find(id)" do

    it "looks up a driver using their id" do
    end

  end

  describe "trip_list()" do

    it "returns an array of all the driver's trips" do
    end

  end

  describe "average_rating" do

    it "returns the average rating of driver" do
    end

  end

end
