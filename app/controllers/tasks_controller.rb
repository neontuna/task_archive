class TasksController < ApplicationController
  # def index
  #   @tasks = find_parent.tasks
  # end

  def show
    @task = Task.find_by_id(params[:id])
    @workrecords = @task.workrecords.includes(:workentries)
  end

  private

  # def find_parent
  #   @parent ||=
  #     if params[:customer_id]
  #       Customer.find_by_id(params[:customer_id])
  #     elsif params[:contact_id]
  #       Contact.find_by_id(params[:contact_id])
  #     end
  # end
end
