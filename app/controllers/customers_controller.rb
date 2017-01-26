class CustomersController < ApplicationController
	PAGE_SIZE = 10

	def index
		@page = (params[:page] || 0).to_i
		if params[:keywords].present?
			@keywords = params[:keywords]
			customer_search_term = CustomerSearchTerm.new(@keywords)
			@customers = Customer.where(
				customer_search_term.where_clause,
				customer_search_term.where_args).
			order(customer_search_term.order).
			offset(PAGE_SIZE * @page).limit(PAGE_SIZE)

			# Plain search method using keywords as text
			# those method are to be compared with custom SQL
			# search 
			# @customers = Customer.search(@keywords)

			# @customers = Customer.ft_search(@keywords)

		else
			@customers = []
		end

		respond_to do |format|
			format.html {}
			format.json { render json: @customers }
		end
	end
end
