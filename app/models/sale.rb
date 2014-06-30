class Sale < ActiveRecord::Base
	belongs_to :costumer, :autosave => true
	has_many :detailSales, :autosave => true
	accepts_nested_attributes_for :detailSales
end