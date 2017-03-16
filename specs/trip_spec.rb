require_relative 'spec_helper'

describe "RideShare::Trip" do

  let(:new_trip) {RideShare::Trip.new({trip_id: 601, driver_id: 101, rider_id: 301, date: '2017-01-02', rating: 5})}

  describe "Trip initialize" do

    it "must be an instance of Trip class" do
      new_trip.must_be_instance_of RideShare::Trip
    end

    it "takes a trip id, Trip id, rider id, date and rating" do

      trip_id = 601
      driver_id = 101
      rider_id = 301
      date = '2017-01-02'
      rating = 5

      new_trip.must_respond_to :trip_id
      new_trip.trip_id.must_equal trip_id

      new_trip.must_respond_to :driver_id
      new_trip.driver_id.must_equal driver_id

      new_trip.must_respond_to :rider_id
      new_trip.rider_id.must_equal rider_id

      new_trip.must_respond_to :date
      new_trip.date.must_equal date

      new_trip.must_respond_to :rating
      new_trip.rating.must_equal rating
    end

    it "raises an error if rating is anything other than integers 1-5" do

      new_trip.rating.must_be_kind_of Integer
      #according to ruby docs about assert, default message will be used if none was given.
      assert(new_trip.rating >= 1)
      assert(new_trip.rating<= 5)
    end
  end

  describe "self.all" do

    it "everything in the array is an instance of Trip" do

      RideShare::Trip.all.each do |trip|
        trip.must_be_instance_of RideShare::Trip
      end
    end

    it "returns the correct number of trips" do
      RideShare::Trip.all.length.must_equal 600
    end

    it "correctly matches first and last Trip info" do
      # 1,1,54,2016-04-05,3
      RideShare::Trip.all[0].trip_id.must_equal(1)
      RideShare::Trip.all[0].driver_id.must_equal(1)
      RideShare::Trip.all[0].rider_id.must_equal(54)
      RideShare::Trip.all[0].date.must_equal('2016-04-05')
      RideShare::Trip.all[0].rating.must_equal(3)
      # 600,61,168,2016-04-25,3
      RideShare::Trip.all[-1].trip_id.must_equal(600)
      RideShare::Trip.all[-1].driver_id.must_equal(61)
      RideShare::Trip.all[-1].rider_id.must_equal(168)
      RideShare::Trip.all[-1].date.must_equal('2016-04-25')
      RideShare::Trip.all[ -1].rating.must_equal(3)
    end

    it "returns an array of trips from the csv" do
      RideShare::Trip.all.must_be_instance_of Array
    end
  end

  describe "self.find" do
    it "returns nil if trip ID does not exist" do
      RideShare::Trip.find(2000).must_be_nil
    end

    it "Returns an existing trip" do
      existing_trip = RideShare::Trip.find(86)
      existing_trip.must_be_kind_of RideShare::Trip
    end

    it "Can find the first trip from the CSV" do
      first_trip = RideShare::Trip.find(1)

      first_trip.must_be_instance_of RideShare::Trip
      first_trip.trip_id.must_equal 1
    end

    it "Can find the last trip from the CSV" do
      last_trip = RideShare::Trip.find(600)

      last_trip.must_be_instance_of RideShare::Trip
      last_trip.trip_id.must_equal 600
    end
  end
end
