class Customer < ActiveRecord::Base
  has_many :listings
end
