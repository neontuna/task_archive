class CustomersController < ApplicationController
  def index
    @customers = Customer.all.paginate(page: params[:page])
  end

  def show
    
  end

  def tasks
    @customer = Customer.find_by_id(params[:id])
    @tasks = @customer.tasks.paginate(page: params[:page])
  end
end
