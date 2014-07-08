class Costumer < ActiveRecord::Base
	has_many :orders
	has_many :promotions
	has_many :employees, :through => :promotions
end
