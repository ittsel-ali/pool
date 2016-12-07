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

	def edit
		@transaction = Transaction.find(params[:id])
		@games = Game.all
		@edibles = Edible.all
		@transaction.plays.build
		@customer = @transaction.customer
	end

	def update
		@transaction = Transaction.find(params[:id]).update(permit_params)
		redirect_to root_url, notice: 'Transaction updated successfully.'
	end

	def delete
		@transaction = Transaction.find(params[:id])
	end

	def destroy
		@transaction = Transaction.find(params[:id])
		@transaction.destroy
		redirect_to root_url, notice: 'Transaction Deleted successfully.'
	end

	protected
	def permit_params
		params.require(:transaction).permit(:customer_id, :plays_attributes => [:id,:game_id,:quantity_or_duration, :_destroy], :consumes_attributes => [:id,:edible_id,:_destroy])
	end
end
