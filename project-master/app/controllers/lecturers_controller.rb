require 'csv'

class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]
  helper_method :get_modules
  helper_method :get_groupSet
  helper_method :get_teams
  helper_method :get_students
  helper_method :getTeamName
  helper_method :getMembers
  helper_method :getAllTeams
  helper_method :getUATeam
  helper_method :getGroupSetAlgorithm

  #authorize_resource
  # GET /lecturers
  def index
    @lecturers = Lecturer.all

    respond_to do |format|
      format.html
      format.csv do
          response.headers['Content-Type'] = 'text/csv'
          response.headers['Content-Disposition'] = 'attachment; filename=invoice.csv'    
          send_data Lecturer.to_csv(current_user.email)
      end
    end
  end

  # GET /lecturers/dashboard
  def dashboard
  end

  # GET /lecturers/organise
  def organise
    @students = Student.all
  end

  # GET /lecturers/grouping
  def grouping
  end

  # GET /lecturers/group_details
  def group_details
  end
  
  # GET /lecturers/upload_csv
  def upload
  end

  # GET /lecturers/1
  def show
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit
  end

  def with
  end

  # POST /lecturers
  def create
    @lecturer = Lecturer.new(lecturer_params)
     if @lecturer.save
        #render "post_created"
        redirect_to lecturer_dashboard_path, notice: "Post was successfully sent."
      end
  end

  def exportGroupMembers
      Lecturer.exportGroupMembers(current_user.email)
      redirect_to lecturer_grouping_path notice: 'Downloading GroupMembers'
  end

  def import_students
    if !(params.to_s.include?("filename")) # checks if a file was submitted
      flash[:notice] = "Please attach a CSV file"
      redirect_to lecturer_csv_path
    else
      filetype = params[:search][:file]
      if ((filetype.to_path)).include?("csv")
        Lecturer.import(params[:search][:file])
        flash[:notice] = "File uploaded successfully"
        redirect_to lecturer_dashboard_path
      else
        flash[:notice] = "Must be CSV"
        redirect_to lecturer_csv_path
      end
    end
  end

  def setCurrentModule
    if params[:search][:modules] == 'NONE'
      redirect_to lecturers_path, notice: 'You have not been initialised. Request an admin to initialise you in the system'
    else
      user = User.find_by(username: current_user.username)
      user.currentModule = params[:search][:modules]
      user.save
      redirect_to lecturer_dashboard_path
    end
  end

  def setCurrentGroupSetOrganise
    lecturer = Lecturer.find_by(email: current_user.email)
    lecturer.update(currentGroupSet: params[:search][:currentGroupSet])
    lecturer.update(currentTeam: "NONE")
    redirect_to lecturer_organise_path
  end

  def setCurrentGroupSetAssigned
    lecturer = Lecturer.find_by(email: current_user.email)
    lecturer.update(currentGroupSet: params[:search][:currentGroupSet])
    redirect_to lecturer_grouping_path
  end

  def runAlgo
    groupSet = params[:search][:currentGroupSet]
    Group.assignStudents(groupSet)
    for group in Group.where(groupSet:groupSet) do
      group.update(updated: true)
    end
    flash[:notice] = "Groups are now formed"
    redirect_to lecturer_dashboard_path
  end

  def setTeam
    lecturer = Lecturer.find_by(email: current_user.email)
    lecturer.update(currentTeam: params[:search][:teams])
    redirect_to lecturer_organise_path
  end
  
  #moveStudent
  def addStudent
    student_name = params[:search][:students]
    target = params[:search][:teams]
    team = Lecturer.find_by(email:current_user.email).currentTeam
    if target != team
      groupSet = Lecturer.find_by(email:current_user.email).currentGroupSet
      @old_group = Group.find_by(title: team, groupSet: groupSet)
      @new_group = Group.find_by(title: target, groupSet: groupSet)
      if team != "Unnassigned Team"
        team = team[6..-1]
      end
      if target != "Unnassigned Team"
        target = target[6..-1]
      end
      old_students = @old_group.groupMembers.split(',')
      new_students = @new_group.groupMembers.split(',')
      @student = Preference.find_by(groupSet:groupSet, full_name:student_name)
  
      @old_group.groupMembers = (old_students - [@student.username]).join(",")
      @new_group.groupMembers = (new_students + [@student.username]).join(",")
      @old_group.save
      @new_group.save

      @student.update(groupCode:target)
  
    end
    redirect_to lecturer_organise_path
  end


  def get_modules
    @lecturer = Lecturer.find_by(email: current_user.email)
    if @lecturer.nil?
      return [['NONE']]
    else
      module_list = @lecturer.modules.split(",")
      module_lists = []
      for module1 in module_list
        module_lists.push([module1])
      end
      return module_lists
    end
  end
  
  def get_groupSet
    @lecturer = Lecturer.find_by(email: current_user.email)
    currentModule = User.find_by(username: current_user.username).currentModule
    groups = Group.where(moduleCode: currentModule)
    groupSets = []
    for group in groups
      groupSets.push([group.groupSet])
    end
    groupSets = groupSets.uniq
    return groupSets
  end

  def getGroupSetAlgorithm
    @lecturer = Lecturer.find_by(email: current_user.email)
    currentModule = User.find_by(username: current_user.username).currentModule
    groups = Group.where(moduleCode: currentModule)
    groupSets = []
    currentDate = DateTime.now.to_date
    # +3600 accomodating for time zone
    currentTime = DateTime.now.to_time + 3600
    for group in groups
      deadline_date = group.deadline.to_date
      deadline_time = group.deadline.to_time
      if (((deadline_date < currentDate) | ((deadline_date == currentDate) & (deadline_time < currentTime)) & (group.updated != true)))
        groupSets.push([group.groupSet])
      end
    end
    groupSets = groupSets.uniq
    return groupSets
  end

  def get_teams
    groupSet = Lecturer.find_by(email: current_user.email).currentGroupSet
    groups = Group.where(groupSet: groupSet)
    groupNames = []
    for group in groups
      groupNames.push([group.title])
    end
    return groupNames
  end

  def get_students
    if Lecturer.find_by(email:current_user.email).currentTeam == "NONE"
      return [["VIEW A TEAM"]]
    else
      team = Lecturer.find_by(email:current_user.email).currentTeam
      groupSet = Lecturer.find_by(email:current_user.email).currentGroupSet
      students = Group.find_by(title: team, groupSet: groupSet).groupMembers.split(',')
      studentNames = []
      for student in students
        studentNames.push([Preference.find_by(username:student , groupSet: groupSet).full_name])
      end
      return studentNames
    end
  end

  def getMembers
    team = Lecturer.find_by(email:current_user.email).currentTeam
    if team != "NONE"
      groupSet = Lecturer.find_by(email:current_user.email).currentGroupSet
      students = Group.find_by(title: team, groupSet: groupSet).groupMembers.split(',')
      
      preferences = []
      for student in students
        preferences.push(Preference.find_by(username:student, groupSet: groupSet))
      end
    else
      preferences = []
    end
    puts preferences
    return preferences
  end

  def getUATeam
    groupSet = Lecturer.find_by(email:current_user.email).currentGroupSet
    return Preference.where(groupSet: groupSet, groupCode: 'Unnassigned Team')
  end

  def getAllTeams
    groupSet = Lecturer.find_by(email:current_user.email).currentGroupSet
    return Preference.where(groupSet: groupSet).where.not(groupCode: 'Unnassigned Team')
  end

  def getTeamName
    return Lecturer.find_by(email: current_user.email).currentTeam
  end

  # PATCH/PUT /lecturers/1
  def update
    if @lecturer.update(lecturer_params)
      redirect_to @lecturer, notice: 'Lecturer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lecturers/1
  def destroy
    @lecturer.destroy
    redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecturer_params
      params.fetch(:lecturer, {})
    end
end
