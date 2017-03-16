require_relative 'spec_helper'

describe "RideShare::Rider" do
  let(:my_rider) {RideShare::Rider.new({rider_id: 15, name: 'Miss Lori Okuneva', phone: '(317) 197-0404 x7013'})}

  describe "rider#initialize" do

    it "must be an instance of Rider" do
      my_rider.must_be_instance_of RideShare::Rider
    end

    it "Takes an ID, a name and a phone_number" do

      id = 301,
      name = "Zane Alexander",
      phone = "123-456-7890"

      my_rider.must_respond_to :rider_id
      my_rider.rider_id.must_equal id
      my_rider.must_respond_to :name
      my_rider.name.must_equal name
      my_rider.must_respond_to :phone
      my_rider.phone.must_equal phone

      my_rider.rider_id.must_be_kind_of Integer
      my_rider.name.must_be_kind_of String
      my_rider.phone.must_be_kind_of String
    end

  end

  describe "self.all" do

    it "returns an array with the correct info and number of riders" do
      RideShare::Rider.all.must_be_instance_of Array
      RideShare::Rider.all.each do |rider|
        rider.must_be_instance_of RideShare::Rider
      end
      RideShare::Rider.all.length.must_equal 300

      RideShare::Rider.all[0].rider_id.must_equal(1)
      RideShare::Rider.all[0].name.must_equal('Nina Hintz Sr.')
      RideShare::Rider.all[0].phone.must_equal('560.815.3059')
      RideShare::Rider.all[-1].rider_id.must_equal(300)
      RideShare::Rider.all[-1].name.must_equal('Miss Isom Gleason')
      RideShare::Rider.all[-1].phone.must_equal('791-114-8423 x70188')
    end

  end

  describe "self.find" do
    it "Returns an existing rider" do

       my_rider.must_be_kind_of RideShare::Rider
       my_rider.rider_id.must_equal 86

    end

    it "Can find the first rider from the CSV" do

      my_rider.must_be_instance_of RideShare::Rider
      my_rider.rider_id.must_equal 1
    end

    it "Can find the last rider from the CSV" do
      my_rider.must_be_instance_of RideShare::Rider
      my_rider.rider_id.must_equal 300
    end
  end

  describe "RideShare::Rider.find_trips" do
    let(:rider_trips) { RideShare::Trip.rider_id(54).find_trips }
    it "returns array of trips associated with the rider's ID" do
      rider_trips.must_be_instance_of Array
      rider_trips.length.must_equal 2
      my_rider.find_trips.each do |trip|
        trip.must_be_instance_of RideShare::Trip
      end
    end
  end

end
