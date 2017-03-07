require_relative 'spec_helper'
require_relative '../lib/driver'

describe "RideShare::Rider" do

  describe "Driver#initialize" do
    it
    it "Takes a name, ID and VIN" do

    end

    it "raises an error if the VIN is not the 17 characters in length" do
      proc {
      Driver.new("24")
    }.must_raise RuntimeError
    end

  end
end
