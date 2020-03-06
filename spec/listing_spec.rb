require 'spec_helper'

describe Listing do
  describe '#filter' do
    it "filter all condition" do
      expect(Listing.user_filter().length).to eq(Listing.all.length)
    end

    it "filter zipcode condition case 1" do
      expected_array = []
      for each in Listing.user_filter({'zipcode'=> '10023'}, :daily_price) do
        expect(each["zipcode"]).to eq("10023")
        expected_array.append(each["daily_price"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end

    it "filter zipcode condition case 2" do
      expected_array = []
      for each in Listing.user_filter({'zipcode'=> '10024'}, :daily_price) do
        expect(each["zipcode"]).to eq("10024")
        expected_array.append(each["daily_price"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end

    it "filter zipcode condition case 3" do
      expected_array = []
      for each in Listing.user_filter({'zipcode'=> '10023'}, :size) do
        expect(each["zipcode"]).to eq("10023")
        expected_array.append(each["size"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end

    it "filter zipcode condition case 4" do
      expected_array = []
      for each in Listing.user_filter(nil,:zipcode) do
        expected_array.append(each["zipcode"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end

    it "filter zipcode condition case 5" do
      expected_array = []
      for each in Listing.user_filter(nil,:size) do
        expected_array.append(each["size"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end

    it "filter zipcode condition case 5" do
      expected_array = []
      for each in Listing.user_filter(nil,:daily_price) do
        expected_array.append(each["daily_price"])
      end
      expect(expected_array.sort).to eq(expected_array)
    end
  end
end
