class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin_user!, only: [:download]

  def admin
    @users = User.all
    @education_modules = EducationModule.all
    @education_module_completions = EducationModuleCompletion.all

    render({ :template => "dashboard/dashboard" })
  end

  def download
    @models = {}

    # Education Module Completion
    eductation_module_completions = EducationModuleCompletion.all
    education_module_completion_headers = EducationModuleCompletion.column_names
    @education_module_completion = {'objects' => eductation_module_completions, 'headers' => education_module_completion_headers}
    @models['education_module_completion'] = @education_module_completion

    # Movement Module Completion
    movement_module_completions = MovementModuleCompletion.all
    movement_module_completion_headers = MovementModuleCompletion.column_names
    @movement_module_completion = {'objects' => movement_module_completions, 'headers' => movement_module_completion_headers}
    @models['movement_module_completion'] = @education_module_completion

    # Food Journal
    food_journals = FoodJournal.all
    food_journal_headers = FoodJournal.column_names
    @food_journal = {'objects' => food_journals, 'headers' => food_journal_headers}
    @models['food_journal'] = @food_journal

    # Smart Goal
    smart_goals = SmartGoal.all
    smart_goal_headers = SmartGoal.column_names
    @smart_goal = {'objects' => smart_goals, 'headers' => smart_goal_headers}
    @models['smart_goal'] = @smart_goal

    # Pain Journal
    pain_journals = PainJournal.all
    pain_journal_headers = PainJournal.column_names
    @pain_journal = {'objects' => pain_journals, 'headers' => pain_journal_headers}
    @models['pain_journal'] = @pain_journal

    # Mood Journal
    mood_journals = MoodJournal.all
    mood_journal_headers = MoodJournal.column_names
    @mood_journal = {'objects' => mood_journals, 'headers' => mood_journal_headers}
    @models['mood_journal'] = @mood_journal

    # User
    users = User.all
    user_headers = User.column_names
    @user = {'objects' => users, 'headers' => user_headers}
    @models['user'] = @user

    respond_to do |format| 
      format.xlsx {render xlsx: 'download',filename: "PainNavigator-Download_#{Time.now.strftime("%Y%m%d%I%M%S")}.xlsx"}
    end
  end

  def get_user
    @user ||= User.find_by(uid: params[:uid])
  end

end
