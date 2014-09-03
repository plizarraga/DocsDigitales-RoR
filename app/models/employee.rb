class Employee < ActiveRecord::Base
	belongs_to :store
	has_one :employee, through: :stores
end
