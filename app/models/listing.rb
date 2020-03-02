class Listing < ActiveRecord::Base
  @valid_sort_cols = [:storage_id, :zipcode, :daily_price]

  @col_names = {name: 'Name',
                address: 'Address',
                city: 'City',
                state: 'State',
                zipcode: 'Zip Code',
                daily_price: 'Daily Price',
                size: 'Size'}

  @index_display_cols = {name: 'Name',
                         zipcode: 'Zip Code',
                         daily_price: 'Daily Price'}

  class << self
    attr_reader :valid_sort_cols
    attr_reader :col_names
    attr_reader :index_display_cols
  end

  def self.user_filter(conditions=nil, sorted_col=nil)
    if conditions.nil? and (sorted_col.nil? or !@valid_sort_cols.include?sorted_col.to_sym)
      return self.all
    elsif conditions.nil?
      return self.order(sorted_col)
    elsif sorted_col.nil? or not @valid_sort_cols.include?sorted_col.to_sym
      return self.where(:zipcode => conditions["zipcode"])
    else
      return self.where(:zipcode => conditions["zipcode"]).order(sorted_col)
    end
  end

end