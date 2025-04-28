require 'rails_helper'

RSpec.describe DistanceCalculator do
  describe '.distance_between' do
    it 'calculates the correct distance between two coordinates' do
      mumbai_lat = 19.0590317
      mumbai_lon = 72.7553452
      customer_lat = 19.0760
      customer_lon = 72.8777

      distance = described_class.distance_in_km(mumbai_lat, mumbai_lon, customer_lat, customer_lon)
      expect(distance).to be_within(5).of(15)
    end
  end
end