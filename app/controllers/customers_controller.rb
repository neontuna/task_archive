class CustomersController < ApplicationController
  def index
    @customers = Customer.all.paginate(page: params[:page])
  end

  def tasks
    @customer = Customer.find_by_id(params[:id])
    @tasks = @customer.tasks.paginate(page: params[:page])
    render :show
  end

  def contacts
    @customer = Customer.find_by_id(params[:id])
    @contacts = @customer.contacts.paginate(page: params[:page])
    render :show
  end
end
