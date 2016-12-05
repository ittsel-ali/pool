class TransactionsController < ApplicationController
	autocomplete :customer, :full_name

	def index
		@customer = Customer.new
		
		@transactions = Transaction.all
		
		@transaction = Transaction.new
		@transaction.plays.build

		@games = Game.all
		@edibles = Edible.all
	end
	
	def new 
	end
	
	def create
		@transaction = Transaction.new(permit_params)
		
		if @transaction.save 
			redirect_to root_url, notice: 'Transaction created successfully.'
		end 
	end

	def update
		@transaction = Transaction.find(params[:id]).update(permit_params)
	end

	protected
	def permit_params
		params.require(:transaction).permit(:customer_id, :plays_attributes => [:game_id,:quantity_or_duration], :consumes_attributes => [:edible_id])
	end
end
