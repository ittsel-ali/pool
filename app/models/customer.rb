class Customer < ActiveRecord::Base
	has_many :transactions

	accepts_nested_attributes_for :transactions
end
