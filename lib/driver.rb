require 'csv'

module RideShare

  class Driver

    attr_reader :driver_id, :name, :vin

    def initialize(driver_info)

      @driver_id = driver_info[:driver_id]
      @name = driver_info[:name]
      @vin = driver_info[:vin]

      raise ArgumentError.new "VIN should be 17 characters long." if vin.length != 17
    end

    def self.all
      @drivers = []
      CSV.foreach("support/drivers.csv", {:headers => true}) do |line|
        @drivers << self.new({driver_id:line[0].to_i, name:line[1], vin:line[2]})
      end
      return @drivers
    end

    def self.find(id)
      drivers_lookup = Driver.all.find { |driver| driver.driver_id == id }
      return drivers_lookup
    end

    def find_trips
      RideShare::Trip.get_trips_by_driver_id(@driver_id)
    end

    def average_rating
      total_rating = 0.0
      find_trips.each do |trip|
        total_rating += trip.rating
      end
      average_rating = total_rating/find_trips.length
    end
  end
end
