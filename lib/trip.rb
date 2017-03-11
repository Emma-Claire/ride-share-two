module RideShare
  class Trip
    
    attr_accessor

    def initialize
      # has an ID, rider ID, a driver ID, date, rating

      #output error if rating is not 1-5
      # Each rating should be within an acceptable range (1-5) test edge cases
    end

    def self.all
      # retrieve all trips from the CSV file
    end


    def driver
      # retrieve the associated driver instance through the driver ID
    end

    def rider
      # retrieve the associated rider instance through the rider ID
    end

    def self.all_driver(driver_id)
      # find all trip instances for a given driver ID
    end

    def self.all_rider(rider_id)
      # find all trip instances for a given rider ID
    end
  end

end
