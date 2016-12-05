class Edible < ActiveRecord::Base
	has_many :consumes
	has_many :transactional, foreign_key: 'transaction_id', class_name: 'Transaction'
end
