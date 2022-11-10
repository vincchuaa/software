class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  helper_method :get_unwantedMembers
  
  # GET /groups
  def index
    @groups = Group.all
    respond_to do |format|
      format.html
      format.csv do
          response.headers['Content-Type'] = 'text/csv'
          response.headers['Content-Disposition'] = 'attachment; filename=invoice.csv'    
          send_data Group.to_csv(current_user.email)
        end
    end
  end

  # GET /groups/1
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit 
  end

  # POST /groups
  def create  
    @students = Student.all
    numStudents = 0
    if params[:group][:groupSize].to_i.nil? or params[:group][:unwantedMembers].to_i.nil? or params[:group][:moduleCode].nil? or params[:group][:deadline].nil? or params[:group][:groupSet].nil?
      flash[:notice] = "Please make sure all fields are filled"
      redirect_to lecturer_form_path
    elsif ((params[:group][:groupSize]).to_i < 2) 
      flash[:notice] = "Group size must be at least 2"
      redirect_to lecturer_form_path
    elsif (params[:group][:unwantedMembers].to_i > ((params[:group][:groupSize].to_i) -1))
      flash[:notice] = "Ammount of Unwanted Members must be at most 2 less than team size"
      redirect_to lecturer_form_path
    elsif !(Group.find_by(moduleCode: params[:group][:groupSet]).nil?)
      flash[:notice] = "There is already a project with that name!"
      redirect_to lecturer_form_path
    else     
      for student in @students
        module_list = student.modules.split(",")
        if module_list.include?(params[:group][:moduleCode].upcase)
          numStudents += 1
          @preference = Preference.new()
          @preference.groupSet = params[:group][:groupSet]
          @preference.nonPartners = ""
          @preference.partners = ""
          @preference.groupCode = ""
          @preference.gender = ""
          @preference.username = student.username
          @preference.moduleCode = params[:group][:moduleCode].upcase
          @preference.full_name = student.forename + " " + student.middlename + " " + student.surname
          @preference.filled = FALSE
          @preference.feeStatus = student.feeStatus
          @preference.save
        end
      end

      numGroups = (numStudents/(params[:group][:groupSize].to_f)).ceil
      (1..numGroups).each do |i|
        @group1 = Group.new()
        @group1.groupSet = params[:group][:groupSet]
        @group1.groupSize = params[:group][:groupSize].to_i
        @group1.deadline = params[:group][:deadline].to_datetime
        @group1.unwantedMembers = params[:group][:unwantedMembers].to_i
        @group1.groupMembers = ""
        @group1.moduleCode = params[:group][:moduleCode]
        @group1.title = "Group " + i.to_s
        @group1.groupCode = i.to_s
        @group1.final = FALSE
        @group1.updated = FALSE
        @group1.save
      end
      flash[:notice] = "Form sent successfully"
      redirect_to lecturer_dashboard_path
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.fetch(:group, {})
    end
end
