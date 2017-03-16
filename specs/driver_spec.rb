require_relative 'spec_helper'

describe "RideShare::Driver" do

  let(:new_driver) {RideShare::Driver.new({driver_id: 123, name: 'Zane Alexander', vin: '12345678901234567'})}
  let(:bad_driver) {RideShare::Driver.new({driver_id: 123, vin: "badvin", name: "Zane Alexander"})}
  let(:first_driver) { RideShare::Driver.find(1)}
  let(:existing_driver) { RideShare::Driver.find(86)}
  let(:last_driver) { RideShare::Driver.find(100)}

  let(:driver_trips) {RideShare::Driver.find(1)}
  let(:driver_trips_2) {RideShare::Driver.find_trips(1)}
  ##but to find a trip you need a trip id acording with your code
  let(:all_drivers) { RideShare::Driver.all }

  describe "#initialize" do
    ##it is sugested that each it has the fewest assertions as possible,
    #so it is easy to identify which one is failing
    it "driver_id" do
      new_driver.must_respond_to :driver_id
      new_driver.driver_id.must_equal 123
      new_driver.driver_id.must_be_kind_of Integer
    end

    it "name" do
      new_driver.must_respond_to :name
      new_driver.name.must_equal 'Zane Alexander'
      new_driver.name.must_be_kind_of String
    end

    it "vin" do
      new_driver.must_respond_to :vin
      new_driver.vin.must_equal "12345678901234567"
      new_driver.vin.must_be_kind_of String
      new_driver.vin.length.must_equal 17
    end

    it "raises a Argumenterror if the VIN is not 17 characters" do
      proc {bad_driver}.must_raise ArgumentError
    end

  end

  describe "self.all" do
    #set and use the variables defined at the begging
    it "Everything in the array is an instance of driver" do
      all_drivers.each do |driver|
        driver.must_be_instance_of RideShare::Driver
      end
    end

    it "The number of drivers is correct" do
      all_drivers.length.must_equal 100
    end

    it "correctly matches first and last driver data" do
      all_drivers[0].driver_id.must_equal(1)
      all_drivers[0].name.must_equal('Bernardo Prosacco')
      all_drivers[0].vin.must_equal('WBWSS52P9NEYLVDE9')
      all_drivers[-1].driver_id.must_equal(100)
      all_drivers[-1].name.must_equal('Minnie Dach')
      all_drivers[-1].vin.must_equal('XF9Z0ST7X18WD41HT')
    end

    it "returns a list of all drivers from the csv" do
      RideShare::Driver.all.must_be_instance_of Array
    end

  end

  describe "self.find" do

    it "returns nil if driver id does not exist" do
      RideShare::Driver.find(780).must_be_nil
    end

    it "returns an existing driver" do
      existing_driver.must_be_kind_of RideShare::Driver
    end
    ##you werent asking for the driver_id
    it "returns the first driver from the CSV" do
      first_driver.must_be_instance_of RideShare::Driver
      first_driver.driver_id.must_equal 1
    end

    it "returns the last driver from the CSV" do
      last_driver.must_be_instance_of RideShare::Driver
      last_driver.driver_id.must_equal 100
    end
  end

  describe "self.find_trips(driver_id)" do
    it "returns trips using the driver's ID" do
      puts 'driver_trips --->', driver_trips.inspect
      #driver_trips is an instance of Driver look at line 11
      #I found out by printing it and .inspect
      # driver_trips.trip_id.must_equal(55)
      #you were looking for a trip id but a driver has one or many trips
      driver_trips_2.each do |trip|
        trip.must_be_instance_of RideShare::Trip
      end
    end

    it "returns an array of all the trips of a driver" do
      driver_trips_2.length.must_equal 9
    end

  end

  describe "self.average_rating" do

    it "returns the average rating of the driver" do
      RideShare::Driver.average_rating(1).must_equal 2.3333333333333335
      #dont you have to pass something here? How does it know which driver?
      #I tried this and didnt work eather
      #first_driver.average_rating.must_equal 28.0 / 8
      ##NoMethodError: undefined method `average_rating' for RideShare::Driver:Class
    end
  end

end
