require 'csv'

module RideShare
  class Trip

    attr_accessor :trip_id, :driver_id, :rider_id, :date, :rating

    def initialize(trip_info)
      @trip_id = trip_info[:trip_id]
      @driver_id = trip_info[:driver_id]
      @rider_id = trip_info[:rider_id]
      @date = trip_info[:date]
      @rating = trip_info[:rating]
    end

    def self.all
      trips = []
      CSV.foreach("support/trips.csv", {:headers => true}) do |line|
        trips << self.new({trip_id:line[0].to_i, driver_id:line[1].to_i, rider_id:line[2].to_i, date:line[3], rating:line[4].to_i})
      end
      return trips
    end

    def get_trips_by_driver_id
    end

    def self.find(trip_id)
      trips = Trip.all
      return trips.find {|trip| trip.trip_id == trip_id}
    end
  end
end
