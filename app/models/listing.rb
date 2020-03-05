class Listing < ActiveRecord::Base
  belongs_to :customer

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

  def self.standardize_conditions(conditions)
    conditions_new = {}
    conditions.keys.each do |con_key|
      if not conditions[con_key].nil? and not conditions[con_key].empty?
        conditions_new[con_key] = conditions[con_key]
      end
    end
    conditions_new
  end

  def self.user_filter(conditions=nil, sorted_col=nil)
    if (conditions.nil? or conditions.empty?) and (sorted_col.nil? or !@valid_sort_cols.include?sorted_col.to_sym)
      return self.all
    elsif conditions.nil? or conditions.empty?
      return self.order(sorted_col.to_sym)
    elsif (sorted_col.nil? or not @valid_sort_cols.include?sorted_col)
      return self.where(:zipcode => conditions["zipcode"])
    else
      return self.where(:zipcode => conditions["zipcode"]).order(sorted_col)
    end
  end

end