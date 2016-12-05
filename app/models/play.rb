class Play < ActiveRecord::Base
	belongs_to :transactional, foreign_key: 'transaction_id', class_name: 'Transaction'
	belongs_to :game
end
