require 'csv'

module RideShare

  class Rider
    attr_reader :rider_id, :name, :phone

    def initialize(rider_info)
      @rider_id = rider_info[:rider_id]
      @name = rider_info[:name]
      @phone = rider_info[:phone]
    end

    def self.all
      @riders = []
      CSV.foreach("support/riders.csv", {:headers => true}) do |line|
        @riders << self.new({rider_id:line[0].to_i, name:line[1], vin:line[2]})
      end
      return @riders
    end
  end

  def self.find(rider_id)
    rider_lookup = Rider.all
    rider_lookup.find { |rider| rider.rider_id == rider_id }
    puts "invalid rider id" if rider_lookup == nil
    return rider_lookup
  end

  def self.find_trips(id)
    trips = RideShare::Trip.all
    rider_trips = []
    trips.each do |trip|
      if trip.rider_id == id
        rider_trips.push(trip)
      end
    end
    return rider_trips
  end
end
