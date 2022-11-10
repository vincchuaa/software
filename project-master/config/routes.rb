Rails.application.routes.draw do

  resources :groupmembers
  resources :course_modules
  resources :projects
  resources :preferences
  resources :pairings
  resources :groups
  resources :lecturers
  resources :students
  devise_for :users
  resources :course_modules
  resources :projects
  resources :preferences
  resources :pairings
  resources :groups
  resources :students
  resources :lecturers do
    collection {post :import}
  end
  resources :admins
  resources :users

  mount EpiCas::Engine, at: "/"
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
  get "/suspend", to: "users#suspend", :as => 'suspend'
  get '/createPreference' => 'preferences_controller#createPreference', :as => 'createPreference'

  get :ie_warning, to: 'errors#ie_warning'
  get 'lecturer_dashboard', to: 'lecturers#dashboard'
  get 'student_dashboard', to: 'students#dashboard'
  get 'select_groupset', to: 'lecturers#groupsetSelect'
  get 'lecturer_organise', to: 'lecturers#organiseGroups'
  get 'lecturer_organise_teams', to: 'lecturers#organiseTeams'
  get 'lecturer_organise_students', to: 'lecturers#organiseStudents'
  get 'lecturer_grouping', to: 'lecturers#grouping'
  get 'group_details', to: 'lecturers#group_details'
  get 'lecturer_form', to: 'groups#new'
  get 'preferences_form', to: 'preferences#_form'
  get 'profile', to: 'users#profile'
  get 'upload', to: 'lecturers#upload_csv'
  get 'form', to: 'students#form'
  get 'emails', to: 'lecturers#emails'
  get 'lecturers_main_page', to: 'lecturers#index'
  get 'students_main_page', to: 'students#index'
  get 'my_group', to: 'students#mygroup'
  get 'admin_user_info', to: 'admins#user_info'
  get 'run_algo', to: 'lecturers#run_algo'
  post 'lecturer/runAlgo', to: 'lecturers#runAlgo'
  post 'admin/importlecturers' , to: 'admins#import_lecturers'
  post 'lecturer/importstudents' , to: 'lecturers#import_students'
  post 'lecturer/setCurrentGroupSet', to: 'lecturers#setCurrentGroupSet'
  post 'lecturer/setCurrentGroupSetOrganise', to: 'lecturers#setCurrentGroupSetOrganise'
  post 'lecturer/setCurrentGroupSetAssigned', to: 'lecturers#setCurrentGroupSetAssigned'
  post 'lecturer/setCurrentModule', to: 'lecturers#setCurrentModule'
  post 'student/setCurrentModule', to: 'students#setCurrentModule'
  post 'lecturer/setTeam', to: 'lecturers#setTeam'
  post 'lecturer/removeStudent', to: 'lecturers#removeStudent'
  post 'lecturer/addStudent', to: 'lecturers#addStudent'
  post 'admin/suspenduser', to: 'admins#suspend_user'
  post 'admin/promoteadmin', to: 'admins#promote_admin'
  post 'admin/unsuspenduser', to: 'admins#unsuspend_user'
  post 'admin/demoteadmin', to: 'admins#demote_admin'
  post 'student/getgroup', to: 'students#get_group'
  get 'lecturer/exportGroupMembers', to: 'lecturers#exportGroupMembers'

  # admins routes
  get 'admins_main_page', to: 'admins#index'
  get 'admin_csv', to: 'admins#upload_csv'
  get 'user_info', to: 'admins#user_info'
  
  get 'classlistexport', to: 'admins#classlist_csv'

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # Commented out temporarily to be used to test admin pages
  # TO BE REMOVED BEFORE FINAL SUBMISSION
   #root to: "admins#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
