
require 'csv'

module RideShare

  class Driver

    attr_reader :id, :name, :vin

    def initialize(driver_info)

      @id = driver_info[:id]
      @name = driver_info[:name]
      @vin = driver_info[:vin]

      raise ArgumentError.new "VIN should be 17 characters long." if vin.length != 17
    end

    def self.all
      @drivers = []
      CSV.foreach("support/drivers.csv", {:headers => true}) do |line|
        @drivers << self.new({id:line[0].to_i, name:line[1], vin:line[2]})  #need to get rid of first line
      end
      return @drivers
    end

    def self.find(id)
      drivers_lookup = Driver.all
      return drivers_lookup.find { |driver| driver.id == id }
    end

  end

  def find_trips
    return RideShare::Trips.get_trips_by_driver_id(@id) #this gets the list of all driver trips using driver id and calls on Trip class
  end

  def average_rating

  end

end
