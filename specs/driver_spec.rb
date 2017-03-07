require_relative 'spec_helper'

describe "RideShare::Driver" do

  before do
    driver = RideShare::Driver.new('Zane Alexander', 101, '12345671234567123')

  end

  describe "Driver#initialize" do

    it "generates new instance of driver" do

    end

    it "Takes a name, ID and VIN" do

    end

    it "raises a runtime error if the VIN is not the 17 characters in length" do

    end
  end


  describe "trip_list" do

    it "outputs a list of all the driver's trips" do
    end

  end

  describe "find.all" do

    it "retrieves a list of all drivers from the csv" do
    end
  end

  describe "average_rating" do

    it "returns the average rating of driver" do

    end

  end

  describe "find.driver(id) " do
    it "looks up a driver using id" do

    end

  end



end
