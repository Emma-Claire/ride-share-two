require_relative 'spec_helper'

describe "RideShare::Driver" do

  let(:new_driver) {RideShare::Driver.new({driver_id: 123, name: 'Zane Alexander', vin: '12345678901234567'})}

  # let(:driver_trips) {RideShare::Driver.find_trips(5)}

  let(:rating) { RideShare::Driver.average_rating(5)}

  describe "Driver#initialize" do

    it "Takes an ID, a name and a vin" do

      name = 'Zane Alexander'
      id = 123
      vin = '12345678901234567'

      new_driver.must_respond_to :id
      new_driver.id.must_equal id
      new_driver.must_respond_to :name
      new_driver.name.must_equal name
      new_driver.must_respond_to :vin
      new_driver.vin.must_equal vin
    end


    it "raises a Argumenterror if the VIN is not 17 characters in length" do
      data = {
        id: 123,
        vin: "badvin",
        name: "Zane Alexander"
      }

      proc {
        new_driver(data)
      }.must_raise ArgumentError
    end

  end

  describe "self.all" do

    it "Everything in the array is an instance of driver" do
      RideShare::Driver.all.each do |driver|
        driver.must_be_instance_of RideShare::Driver
      end
    end

    it "The number of drivers is correct" do
      RideShare::Driver.all.length.must_equal 100
    end

    it "correctly matches first and last driver data" do
      RideShare::Driver.all[0].id.must_equal(1)
      RideShare::Driver.all[0].name.must_equal('Bernardo Prosacco')
      RideShare::Driver.all[0].vin.must_equal('WBWSS52P9NEYLVDE9')
      RideShare::Driver.all[-1].id.must_equal(100)
      RideShare::Driver.all[-1].name.must_equal('Minnie Dach')
      RideShare::Driver.all[-1].vin.must_equal('XF9Z0ST7X18WD41HT')
    end

    it "returns a list of all drivers from the csv" do
      RideShare::Driver.all.must_be_instance_of Array
    end

  end

  describe "self.find" do

    it "Returns an existing driver" do
      existing_driver = RideShare::Driver.find(86)
      existing_driver.must_be_kind_of RideShare::Driver
    end

    it "Can find the first driver from the CSV" do
      first_driver = RideShare::Driver.find(1)
      first_driver.must_be_instance_of RideShare::Driver
      first_driver.id.must_equal 1
    end

    it "Can find the last driver from the CSV" do
      last_driver = RideShare::Driver.find(100)
      last_driver.must_be_instance_of RideShare::Driver
      last_driver.id.must_equal 100
    end

    # it "Raises an error for a driver ID that doesn't exist" do
    #   proc{
    #     RideShare::Driver.find(983)
    #   }.must_output (/.+/)
    # end


  end

  describe "trip.find(id)" do

    it "looks up trips using the driver's ID" do

    end

    it "returns an array of all the trips of a driver" do

    end


  end

  describe "average_rating" do

    it "finds driver rating using the driver's ID" do
    end

    it "pushes all ratings of given driver into an array" do
    end

    it "returns the average rating of the driver" do
    end

  end

end
