require "http"
require 'uri'
require 'json'

class Listing < ActiveRecord::Base
  belongs_to :customer
  mount_uploaders :images, ImagesUploader

  # def initialize()
  #   super.initialize()
  #   @azure_map_key = Geo_function_initializer.new.azure_map_key
  #   debugger
  # end

  @azure_map_key = Geo_function_initializer.new.azure_map_key

  @valid_sort_cols = [:zipcode, :daily_price, :size]

  @index_display_cols = [:name,:zipcode,:daily_price,:size]

  @sym2name = {:name => 'Name',
               :zipcode => 'Zip Code',
               :daily_price => 'Daily Price',
               :address => 'Address',
               :city => 'City',
               :state => 'State',
               :size => 'Size (Cubic Meter)',
               :images => 'Upload images'}

  class << self
    attr_reader :valid_sort_cols
    attr_reader :sym2name
    attr_reader :index_display_cols
    attr_reader :azure_map_key
  end

  def self.standardize_conditions(conditions)
    if conditions.nil?
      return
    end
    conditions_new = {}
    conditions.keys.each do |con_key|
      if not conditions[con_key].nil? and not conditions[con_key].empty?
        conditions_new[con_key] = conditions[con_key]
      end
    end
    conditions_new
  end

  def self.get_long_lat_by_address(specific_address)
    geocodeUrlTemplate = 'https://atlas.microsoft.com/search/address/json?'\
                         'subscription-key={subscription-key}&api-version=1&query={query}'\
                         '&language={language}&countrySet={countrySet}&limit={numResults}&view=Auto'

    geo_http_request = geocodeUrlTemplate.gsub('{subscription-key}', URI::encode(@azure_map_key))
                       .gsub('{query}',URI::encode(specific_address))
                       .gsub('{language}','en-US')
                       .gsub('{countrySet}','US')
                       .gsub('{numResults}','1')

    geo_http_response = JSON.parse(HTTP.get(geo_http_request).body)
    location = geo_http_response['results'][0]['position']

    return location
  end

  def self.user_filter(conditions=nil, sorted_col=nil, search_query=nil)
    if not search_query.nil?
      # default show listings only at most 10 miles far away from the search point
      center_loc = get_long_lat_by_address(search_query)
      search_conditions = "lat <= #{center_loc['lat']+0.1} "\
                          "and lat >= #{center_loc['lat']-0.1} "\
                          "and lon <= #{center_loc['lon']+0.1} "\
                          "and lon >= #{center_loc['lon']-0.1}"
      after_search_items = self.where(search_conditions)
    else
      after_search_items = self.all
    end
    if (conditions.nil? or conditions.empty?) and (sorted_col.nil? or !@valid_sort_cols.include?sorted_col.to_sym)
      return after_search_items.all
    elsif conditions.nil? or conditions.empty?
      return after_search_items.order(sorted_col.to_sym)
    elsif (sorted_col.nil? or not @valid_sort_cols.include?sorted_col.to_sym)
      return after_search_items.where(:zipcode => conditions["zipcode"])
    else
      return after_search_items.where(:zipcode => conditions["zipcode"]).order(sorted_col)
    end
  end

  def self.validate(listing_params)
    return true
  end

end