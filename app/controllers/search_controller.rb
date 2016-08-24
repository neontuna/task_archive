class SearchController < ApplicationController
  
  def search
    @search_term = params[:q] # used in view
    @search_type = params[:type]    

    if !@search_term || @search_term.length < 1
      flash[:warning] = 
        "Please enter a longer search term"
      redirect_to_back
    else  
      # TODO - figure out searching tasks within contacts and customer
      
      # Defaults to entry/notes search, if type param is set will search contact,
      # customer, or ticket title/description
      if @search_type == "contacts"
        @contacts = Contact.search(@search_term).paginate(page: params[:page])
      elsif @search_type == "customers"
        @customers = Customer.search(@search_term).paginate(page: params[:page])
      elsif @search_type == "tasks"
        @tasks = Task.search(@search_term).order(entrydate: :desc)
                     .paginate(page: params[:page])
      else
        @workentries = Workentry.search(@search_term).order(entrytimestamp: :desc)
                                .paginate(page: params[:page])
      end
    end
  end

end

# TODO - make gist of this, showing WillPaginate:Collection usage
# @tasks = Task.search(@search_term).order(entrydate: :desc)
#   @workentries = Workentry.search(@search_term).order(entrytimestamp: :desc)
#   @tasks_and_entries_all = @tasks + @workentries
#
#   custom pagination needed due to heterogeneous tasks and entries collection
#   current_page = (params[:page] || 1).to_i
#   per_page = 20
#   @tasks_and_entries = WillPaginate::Collection.create(current_page, per_page, @tasks_and_entries_all.length) do |pager|
#     start = (current_page-1) * per_page # assuming current_page is 1 based.
#     pager.replace(@tasks_and_entries_all[start, per_page])
# end