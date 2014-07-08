class Order < ActiveRecord::Base
	belongs_to :costumer, :foreign_key => :cliente_id, :autosave=> true
	has_many :orderDs, :autosave=> true
	accepts_nested_attributes_for :orderDs
end
