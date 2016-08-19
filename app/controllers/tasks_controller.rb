class TasksController < ApplicationController
  def index
  end

  def show
    @task = Task.find_by_id(params[:id])
    @workrecords = @task.workrecords.includes(:workentries)
  end
end
