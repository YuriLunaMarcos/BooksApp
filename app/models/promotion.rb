class Promotion < ActiveRecord::Base
	belongs_to :costumer
	belongs_to :employee
end
