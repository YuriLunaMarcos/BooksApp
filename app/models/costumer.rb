class Costumer < ActiveRecord::Base
	has_many :orders
	has_many :sales 
end
