class Store < ActiveRecord::Base
	belongs_to :user
	has_many :employees, dependent: :destroy
end
