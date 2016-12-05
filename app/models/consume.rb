class Consume < ActiveRecord::Base
	belongs_to :edible
	belongs_to :transactional, foreign_key: "transaction_id", class_name: "Transaction"
end
