class Transaction < ActiveRecord::Base
	belongs_to :customer

	has_many :consumes, dependent: :destroy
	has_many :edibles, :through => :consumes

	has_many :plays, dependent: :destroy
	has_many :games, :through => :plays

	accepts_nested_attributes_for :consumes, :allow_destroy => true, update_only: true
	accepts_nested_attributes_for :plays, :allow_destroy => true, update_only: true
end
