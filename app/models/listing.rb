class Listing < ActiveRecord::Base
  @valid_sort_cols = [:storage_id, :zipcode, :daily_price]

  @col_names = {:storage_id=> 'Storage ID',
                :address=> 'Address',
                :zipcode=> 'Zip Code',
                :daily_price=> 'Daily Price',
                :email=> 'E-mail'}

  @index_display_cols = {:address=> 'Address',
                         :zipcode=> 'Zip Code',
                         :daily_price=> 'Daily Price'}

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