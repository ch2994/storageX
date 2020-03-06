require 'spec_helper'

describe Listing do
  describe '#filter' do
    it "filter all condition" do
      expect(Listing.user_filter().length).to eq(Listing.all.length)
    end

    it "filter zipcode condition" do
      expected_array = []
      for each in Listing.user_filter({'zipcode'=> '10023'}, :daily_price) do
        expect(each["zipcode"]).to eq("10023")
        expected_array.append(each["daily_price"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end
  end
end
