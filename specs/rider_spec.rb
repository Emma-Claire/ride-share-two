# require_relative 'spec_helper'
#
# describe "RideShare::Rider" do
#
# let(:my_rider) {RideShare::Rider.new({rider_id: 301, name: 'Zane Alexander', phone: '123-456-7890'})}
#
#   describe "rider#initialize" do
#
#     it "must be an instance of Rider" do
#       my_rider.must_be_instance_of RideShare::Rider
#     end
#
#     it "Takes an ID, a name and a phone_number" do
#
#       id = 301,
#       name = "Zane Alexander",
#       phone = "123-456-7890"
#
#       my_rider.must_respond_to :rider_id
#       my_rider.rider_id.must_equal id
#       my_rider.must_respond_to :name
#       my_rider.name.must_equal name
#       my_rider.must_respond_to :phone
#       my_rider.phone.must_equal phone
#     end
#
#   end
#
#   describe "self.all" do
#
#     it "returns an array with the correct info and number of riders" do
#       RideShare::Rider.all.must_be_instance_of Array
#       RideShare::Rider.all.each do |rider|
#         rider.must_be_instance_of RideShare::Rider
#       end
#       RideShare::Rider.all.length.must_equal 300
#
#       RideShare::Rider.all[0].rider_id.must_equal(1)
#       Rider.all[0].name.must_equal('Nina Hintz Sr.')
#       RideShare::Rider.all[0].phone.must_equal('560.815.3059')
#       RideShare::Rider.all[-1].rider_id.must_equal(300)
#       RideShare::Rider.all[-1].name.must_equal('Miss Isom Gleason')
#       RideShare::Rider.all[-1].phone.must_equal('791-114-8423 x70188')
#     end
#
#   end
#
#   describe "self.find" do
#
#     it "Returns an existing rider" do
#       existing_rider = RideShare::Rider.find(86)
#       existing_rider.must_be_kind_of RideShare::Rider
#     end
#
#     it "Can find the first rider from the CSV" do
#       first_rider = RideShare::Rider.find(1)
#       first_rider.must_be_instance_of RideShare::Rider
#       first_rider.rider_id.must_equal 1
#     end
#
#     it "Can find the last rider from the CSV" do
#       last_rider = RideShare::Rider.find(300)
#       last_rider.must_be_instance_of RideShare::Rider
#       last_rider.rider_id.must_equal 300
#     end
#
#     it "outputs a message for a rider ID that doesn't exist" do
#       proc{
#         RideShare::Rider.find(983)
#       }.must_output (/.+/)
#     end
#
#   end
#
#   describe "trip.find(id)" do
#
#     it "looks up trips using the rider's ID" do
#
#     end
#
#     it "returns an array of all the trips taken by a specific rider" do
#     end
#
#
#   end
#
#   describe "driver.find(rider_id)" do
#
#     it "returns a list of the drivers instances for a specific rider" do
#     end
#
#   end
#
# end
