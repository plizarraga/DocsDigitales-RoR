class Employee < ActiveRecord::Base
	belongs_to :store
	has_one :user, through: :store
end
