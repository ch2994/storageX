class Listing < ActiveRecord::Base
  belong_to :customer

  @valid_sort_cols = [:zipcode, :daily_price]

  @index_display_cols = [:name,:zipcode,:daily_price,:size]

  @sym2name = {:name => 'Name',
               :zipcode => 'Zip Code',
               :daily_price => 'Daily Price',
               :address => 'Address',
               :city => 'City',
               :state => 'State',
               :size => 'Size (Cubic Meter)'}

  class << self
    attr_reader :valid_sort_cols
    attr_reader :sym2name
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