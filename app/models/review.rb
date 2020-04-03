class Review < ActiveRecord::Base
  @index_display_cols = [:customer_id, :rating, :comments]
  @sym2name = {:customer_id => 'User',
               :rating => 'Rating',
               :comments => 'Comments'}
  class << self
    attr_reader :sym2name
    attr_reader :index_display_cols
  end
end
