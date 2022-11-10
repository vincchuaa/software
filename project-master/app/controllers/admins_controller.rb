require 'csv'

class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  helper_method :get_users

  authorize_resource

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  # validation for CSV file 
  def import_lecturers
    if !(params.to_s.include?("filename")) # checks if a file was submitted
      flash[:notice] = "Please attach a CSV file"
      redirect_to admin_csv_path
    else
      filetype = params[:search][:file]
      if ((filetype.to_path)).include?("csv") # checks if file has a .csv extension
        Admin.import(params[:search][:file])  
        flash[:notice] = "File uploaded successfully"
        redirect_to admins_path
      else
        flash[:notice] = "Must be CSV"
        redirect_to admin_csv_path
      end
    end
  end

  def suspend_user
    user = params[:search][:users]
    User.find_by(username:user).update(suspended: true)
    flash[:notice] = "User has been suspended."
    redirect_to user_info_path
  end

  def unsuspend_user
    user = params[:search][:users]
    User.find_by(username:user).update(suspended: false)
    flash[:notice] = "User has been unsuspended."
    redirect_to user_info_path
  end

  def promote_admin
    user = params[:search][:users]
    User.find_by(username:user).update(admin:true)
    flash[:notice] = "User has been promoted to admin."
    redirect_to user_info_path
  end

  def demote_admin
    user = params[:search][:users]
    User.find_by(username:user).update(admin:false)
    flash[:notice] = "User has been demoted from admin."
    redirect_to user_info_path
  end

  def get_users
    users = []
    User.all.each do |user|
      users.push(user.username)
    end
    return users
  end
  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      redirect_to @admin, notice: 'Admin was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    redirect_to admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:adminID, :username, :currentRole, :newRole)
    end
end
