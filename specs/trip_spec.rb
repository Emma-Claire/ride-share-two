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
      proc {
        RideShare::Trip.new({rating: -1})
      }.must_raise ArgumentError

      proc {
        RideShare::Trip.new({rating: 5.1})
      }.must_raise ArgumentError

      proc {
        RideShare::Trip.new({rating: "one"})
      }.must_raise ArgumentError
    end
  end

  describe "self.all" do

    it "returns an array of trips from the csv" do
      RideShare::Trip.all.must_be_instance_of Array

      it "everything in the array is an instance of Trip" do
        RideShare::Trip.all.each do |trip|
          trip.must_be_instance_of RideShare::Trip
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
          RideShare::Trip.all[-1].rating.must_equal(3)
        end
      end

      describe "driver" do
        it "is an instance of the Driver class" do

        end

        it "returns the associated driver instance through the driver ID" do

        end

      end

      describe "rider" do

        it "is an instance of the Rider class" do

        end

        it "returns the associated driver instance through the rider ID" do

        end
      end

      # describe "self.all_driver(driver_id)" do
      #   # find all trip instances for a given driver ID
      # end
      #
      # describe  "self.all_rider(rider_id)" do
      #   # find all trip instances for a given rider ID
      # end

    end
  end

end
