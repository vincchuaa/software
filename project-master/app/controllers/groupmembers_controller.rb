class GroupmembersController < ApplicationController
  def index
    @lecturers = Lecturer.all

    respond_to do |format|
      format.csv do
          response.headers['Content-Type'] = 'text/csv'
          response.headers['Content-Disposition'] = 'attachment; filename=invoice.csv'    
          send_data Groupmembers.to_csv(current_user.email)
      end
    end
  end
end
