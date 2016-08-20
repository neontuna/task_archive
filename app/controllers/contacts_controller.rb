class ContactsController < ApplicationController
  def show
    @contact = Contact.find_by_id(params[:id])
    @tasks = @contact.tasks.paginate(page: params[:page])
  end
end
