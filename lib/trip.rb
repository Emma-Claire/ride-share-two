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
        trips << self.new({trip_id:line[0], driver_id:line[1], rider_id:line[2], date:line[3], rating:line[4]})
      end
      return trips
    end

    def self.find(trip_id)
    end

    #   def driver
    #     # retrieve the associated driver instance through the driver ID
    #   end
    #
    #   def rider
    #     # retrieve the associated rider instance through the rider ID
    #   end
    #
    #   def self.all_driver(driver_id)
    #     # find all trip instances for a given driver ID
    #   end
    #
    #   def self.all_rider(rider_id)
    #     # find all trip instances for a given rider ID
    #   end
    # end

  end
end
