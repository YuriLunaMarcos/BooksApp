class Employee < ActiveRecord::Base
	has_many :promotions
	has_many :costumers, :through => :promotions
end
