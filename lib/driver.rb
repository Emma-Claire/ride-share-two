
require 'csv'

module RideShare

  class Driver

    attr_reader :id, :name, :vin

    def initialize(driver_info)
      @id = driver_info[:id]
      @name = driver_info[:name]
      @vin = driver_info[:vin]
    end

    def self.all
      @drivers = []
      CSV.open("../support/drivers.csv").each do |line|
        @drivers << self.new(line[0].to_i, line[1].to_s, line[2].to_s)
      end
      return @drivers
    end

    def self.find(id)
    end

    def trips
      return RideShare::Trips.get_trips_by_driver_id(@id)
    end

    def average_rating
    end

  end

end
