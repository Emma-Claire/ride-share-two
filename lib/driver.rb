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
      @drivers
    end

    def self.find(id)
      self.all.find { |driver| driver.driver_id == id }
    end

    def self.find_trips(id)
      RideShare::Trip.all.select { |trip| trip.driver_id == id }
    end

    def self.average_rating(id)
      total_rating = 0.0
      trips = find_trips(id)
      trips.each do |trip|
        total_rating += trip.rating
      end
      total_rating/trips.length
    end
  end
end
