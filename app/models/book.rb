class Book < ActiveRecord::Base
	validates :isbn, uniqueness: { message: "Ya existe el ISBN "}, presence: {message: "Llenelo"}
	has_many :orderDs
end
