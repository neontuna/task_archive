class CustomersController < ApplicationController
  def index
    @customers = Customer.all.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find_by_id(params[:id])
  end
end
