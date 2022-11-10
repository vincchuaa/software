class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :edit, :update, :destroy]
  helper_method :get_unwantedMembers
  helper_method :getDeadline
  # GET /preferences
  def index
    @preferences = Preference.all
  end

  # GET /preferences/1
  def show
  end

  # GET /preferences/new
  def new
    @preference = Preference.new
  end

  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  def create
    @preference = Preference.find_by(username: current_user.username, moduleCode: User.find_by(username: current_user.username).currentModule)
    if !@preference.filled?
      @preference.partners = params[:preference][:partners]
      @preference.nonPartners = params[:preference][:nonPartners]
      @preference.full_name = params[:preference][:full_name]
      @preference.gender = params[:preference][:gender]
      @preference.filled = TRUE

      for preference in Preference.all
        if preference.partners == ""
  
        else
          partners = preference.partners.split(",")
          if partners.include?(params[:preference][:full_name])
            @pairing = Pairing.new()
            @pairing.groupSet = @preference.groupSet
            @pairing.username_a = @preference.username
            @pairing.name_a = @preference.full_name
            @paring.username_b = preference.username
            @pairing.name_b = preference.name_b
            @pairing.groupCode = ""
            @pairing.save
          end
        end
      end

      if @preference.save
        redirect_to student_dashboard_path, notice: 'Preference was successfully registered.'
      else
        render :new
      end
    
    else
      redirect_to student_dashboard_path, notice: 'You have already filled in this form.'
    end
  end

  def get_unwantedMembers
    user = User.find_by(email: current_user.email)
    moduleCode = User.find_by(username: user.username).currentModule
    unwantedMembers = Group.find_by(moduleCode: moduleCode).unwantedMembers
    return unwantedMembers
  end

  def getDeadline
    return Group.find_by(moduleCode: current_user.currentModule).deadline
  end
  
  # PATCH/PUT /preferences/1
  def update
    if @preference.update(preference_params)
      redirect_to @preference, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /preferences/1
  def destroy
    @preference.destroy
    redirect_to preferences_url, notice: 'Preference was successfully destroyed.'
  end

  def parse_info
    @preference.create(student,partner,notPartnerOne,notPartnerTwo)
    redirect_to student_dashboard_path, notice: 'Form sent'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preference_params
      params.fetch(:preference, {})
    end
end
