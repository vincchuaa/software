class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  helper_method :get_modules
  helper_method :get_group
  # authorize_resource

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/form
  def form
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students
  def create
  end

  def setCurrentModule
    if params[:search][:modules] == 'NONE'
      redirect_to students_path, notice: 'You have no active projects'
    else
      user = User.find_by(username: current_user.username)
      user.currentModule = params[:search][:modules]
      user.save
      if Group.find_by(moduleCode: user.currentModule).nil?
        redirect_to students_path, notice: 'You have no active projects'
      else 
        redirect_to student_dashboard_path
      end
    end
  end

  def get_modules
    @student = Student.find_by(username: current_user.username)
    if @student.nil?
      return [['NONE']]
    else
      module_list = @student.modules.split(",")
      module_lists = []
      for module1 in module_list
        module_lists.push([module1])
      end
      return module_lists
    end
  end
  
  def get_group
    currentModule = current_user.currentModule
    userGroupMembers = []
    if (Preference.find_by(username:current_user) != nil)
      groupSet = Preference.find_by(username:current_user).groupSet
      if (groupSet != nil)
        currentModuleGroup = Group.find_by(moduleCode:currentModule, groupSet:groupSet)
        if (currentModuleGroup != nil && currentModuleGroup.final == true)
          groupSetGroups = Group.where(moduleCode:currentmodule)
          userGroupCode = Preference.find_by(username:current_user).groupCode
          userGroupMembers = Group.find_by(groupCode: groupCode).groupMembers.split(",")

        end
      end
    end
    return userGroupMembers
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end
  
  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  # GET students/dashboard
  def dashboard
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:forename, :middlename, surname, :username, :feeStatus, :programme, :gender, :modules)
    end
end
