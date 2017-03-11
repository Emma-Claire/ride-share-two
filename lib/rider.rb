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

    end

    def self.find(id)
    end

    def driver
    end

    def find_trips(rider_id)
    end
  end
end
