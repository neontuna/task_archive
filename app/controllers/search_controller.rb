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
      else
        @customers = Customer.search(params[:q]).paginate(page: params[:page])
      end

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
