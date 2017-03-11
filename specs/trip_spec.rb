require_relative 'spec_helper'
describe "RideShare::Trip" do

  let(:trip) {RideShare::Trip.new({trip_id: 601, driver_id: 101, rider_id: 301, date: '2017-01-02', rating: 5})}

  describe "Trip initialize" do

    it "must be an instance of Trip class" do
      trip.must_be_instance_of RideShare::Trip
    end

    it "takes a trip id, driver id, rider id, date and rating" do
      trip.must_respond_to :id
      trip.id.must_be_instance_of
    end
  end
end
