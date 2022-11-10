require 'csv'

class ClasslistController < ApplicationController
  def export
    @classlist = Classlist.where(organization_id: current_user.organization_id)

    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=classlist.csv"
      end
    end
  end
end