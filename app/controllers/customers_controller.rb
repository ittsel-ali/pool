class CustomersController < ApplicationController
	def index
	end
	
	def new
	end
	
	def create
		@customer = Customer.new(permit_params)
		respond_to do |format|
			format.html do
				if @customer.save
			 		redirect_to root_url, notice: 'Customer created successfully.'
				end
			end 
			
			format.json do 
				if @customer.save
			 		render json: @customer.id
				end
			end
		end
	end

	protected 
	def permit_params
		params.require(:customer).permit(:full_name)
	end
end
