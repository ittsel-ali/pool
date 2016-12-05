class Game < ActiveRecord::Base
	has_many :plays
	has_many :transactional, foreign_key: 'transaction_id', class_name: 'Transaction'
end
