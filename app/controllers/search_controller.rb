class SearchController < ApplicationController
  def search
    if !params[:q] || params[:q].length < 1
      flash[:warning] = 
        "Please enter a longer search term"
      redirect_to_back
    else
      @search_term = params[:q]
      @search_type = params[:type]    
      # defaults to searching customers, if type param present, check for contact
      # of task

      if @search_type == "contacts"
        @contacts = Contact.search(params[:q]).paginate(page: params[:page])
      elsif @search_type == "tasks"
        @tasks = Task.search(params[:q])
        @workentries = Workentry.search(params[:q])
        @tasks_and_entries_all = @tasks + @workentries

        # custom pagination junk
        current_page = (params[:page] || 1).to_i
        per_page = 20
        @tasks_and_entries = WillPaginate::Collection.create(current_page, 30, @tasks_and_entries_all.length) do |pager|
          start = (current_page-1) * per_page # assuming current_page is 1 based.
          pager.replace(@tasks_and_entries_all[start, per_page])
        end
      else
        @customers = Customer.search(params[:q]).paginate(page: params[:page])
      end

      # TODO - figure out task searching on title, description AND workentry summary_notes and internal_notes.  

      # TODO - figure out searching tasks within contacts and customer

      # @snap_its = SnapIt
      #   .search(params[:q])
      #   .paginate(page: params[:page], per_page: 20)

      # users = User.search(params[:q])
      # profiles = Profile.search(params[:q])
      # @users = User
      #   .where( id: (users.pluck(:id) + profiles.pluck(:user_id) ) )
      #   .paginate(page: params[:page], per_page: 20)
    end
  end

  private

  def get_type
    if params[:type] == "contact"
      return :customer
    elsif params[:type] == "task"
      return :task
    end
  end
end
