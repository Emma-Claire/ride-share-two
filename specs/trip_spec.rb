require_relative 'spec_helper'

describe "RideShare::Trip" do

  let(:new_trip) {RideShare::Trip.new({trip_id: 601, driver_id: 101, rider_id: 301, date: '2017-01-02', rating: 5})}

  describe "Trip initialize" do

    it "must be an instance of Trip class" do
      new_trip.must_be_instance_of RideShare::Trip
    end

    it "takes a trip id, driver id, rider id, date and rating" do
      new_trip.must_respond_to :trip_id
      new_trip.trip_id.must_equal new_trip[:trip_id]

      new_trip.must_respond_to :driver_id
      new_trip.trip_id.must_equal new_trip[:driver_id]

      new_trip.must_respond_to :rider_id
      new_trip.trip_id.must_equal new_trip[:rider_id]

      new_trip.must_respond_to :date
      new_trip.trip_id.must_equal new_trip[:date]

      new_trip.must_respond_to :rating
      new_trip.trip_id.must_equal new_trip[:rating]


    end
  end
end
