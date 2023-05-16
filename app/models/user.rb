# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  role                    :integer          default("standard")
#  uid                     :string
#  first_name              :string
#  last_name               :string
#  gender                  :integer
#  commitment              :integer
#  onboard_status          :integer          default(0)
#  profile_status          :integer          default(0)
#  phone                   :string
#  starting_pain_duration  :integer
#  activity_level          :integer
#  pace                    :integer
#  starting_pain_score     :integer
#  dob                     :string
#  email                   :string
#  mood_journals_count     :integer
#  food_journals_count     :integer
#  education_modules_count :integer
#  movement_modules_count  :integer
#  bookmarks_count         :integer
#  smart_goals_count       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  provider_id             :integer
#  wellness_coach_id       :integer
#  has_unreplied_message   :boolean          default(FALSE)
#
class User < ApplicationRecord
  has_many  :education_modules, class_name: "EducationModuleCompletion", dependent: :destroy
  has_many  :food_journals, dependent: :destroy
  has_many  :mood_journals, dependent: :destroy
  has_many  :movement_modules, class_name: "MovementModuleCompletion", dependent: :destroy
  has_many  :pain_journals, dependent: :destroy
  has_many  :pleasant_activities, dependent: :destroy
  has_many  :smart_goals, dependent: :destroy
  has_many  :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many  :received_messages, class_name: "Message", foreign_key: "recipient_id", dependent: :destroy
  belongs_to :provider, class_name: "Provider", foreign_key: "provider_id", counter_cache: true
  after_create :send_welcome_message

  enum role: [:standard, :admin, :wellness_coach]
  enum pace: [:leisurely, :just_right, :zooming]

  def condensed_program 
    provider.condensed_program
  end

  def assign_wellness_coach
    coach = User.where({ :role => "wellness_coach" }).first
    self.wellness_coach_id = coach.id
  end

  def wellness_coach_uid
    wellness_coach = self.wellness_coach_id
    user = User.find_by(id: wellness_coach)
    uid = user.uid
    return uid
  end

  def send_welcome_message
    self.received_messages.create(sender_id: 1, body: "Hi #{self.first_name}, welcome to PainNavigator! My name is Marina and I’ll be supporting you in your program as your Wellness Coach. I’m looking forward to helping you get the most out of the program. Feel free to ask me any questions here. Click the link below to book a time for our first call.")
    self.received_messages.create(sender_id: 1, body: "https://calendly.com/marinasumofallpositive/painnavigator-check-in")
  end

  def last_pain_journal_date
    if self.pain_journals.any? 
      self.pain_journals.last.created_at.to_f * 1000
    else 
      return nil
    end
  end

  def last_food_journal_date
    if self.food_journals.any? 
      self.food_journals.last.created_at.to_f * 1000
    else 
      return nil
    end
  end

  def last_mood_journal_date
    if self.mood_journals.any? 
      self.mood_journals.last.created_at.to_f * 1000
    else 
      return nil
    end
  end

  def education_progress
    if self.education_modules.any?
      if condensed_program
        unit = EducationUnit.where("id > ?", education_modules.last.module_id).where({ :condensed_program => true })[0]
            
        if unit 
          return {
            "progress" => unit.module_order,
            "last_completed_date" => education_modules.last.created_at.to_f * 1000,
          }
        else 
          return {
            "progress" => self.education_modules.last.module_id + 1,
            "last_completed_date" => education_modules.last.created_at.to_f * 1000,
          }
        end
      else 
        return {
          "progress" => self.education_modules.last.module_id + 1,
          "last_completed_date" => education_modules.last.created_at.to_f * 1000,
        }
      end

    else 

      return {
        "progress" => 1, 
        "last_completed_date" => nil
      }
      
    end
  end

  def movement_progress
    if self.movement_modules.any?
      movement_module = self.movement_modules.last

      return {
        "progress" => movement_module.module_id + 1, 
        "last_completed_date" => movement_module.created_at.to_f * 1000
      }

    else 
      return {
        "progress" => 1, 
        "last_completed_date" => nil
      }
    end
  end

  def my_food_journals
    food_journals = self.food_journals
    return food_journals.map { |journal| 
      { 
        id: journal.id, 
        date_time_value: journal.created_at.to_f * 1000, 
        breakfast: journal.breakfast,
        lunch: journal.lunch, 
        dinner: journal.dinner,
        snacks: journal.snacks
      }
    }
  end

  def wellness_coach
    messages = Message.where(sender_id: self.id).or(Message.where(recipient_id: self.id)).order(:created_at)
  end

  def conversation
    messages = Message.where(sender_id: self.id).or(Message.where(recipient_id: self.id)).order(:created_at)
    return messages.map { |message| 
      { 
        id: message.id, 
        body: message.body,
        date_time_value: message.created_at.to_f * 1000, 
        sender_id: message.sender_id, 
        recipient_id: message.recipient_id,
        status: message.status
      }
    }
  end

  def profile
    return {
        first_name: self.first_name, 
        last_name: self.last_name,
        email: self.email,
        uid: self.uid,
        role: self.role,
        gender: self.gender,
        dob: self.dob,
        phone: self.phone,
        activity_level: self.activity_level,
        onboard_status: self.onboard_status,
        profile_status: self.profile_status,
        condensed_program: self.condensed_program
    }
  end

  def onboard
    return {
        starting_pain_duration: self.starting_pain_duration,
        starting_pain_score: self.starting_pain_score,
        enjoyment_of_life: self.enjoyment_of_life,
        activity_interference: self.activity_interference,
        hopes_to_achieve: self.hopes_to_achieve,
        anxious: self.anxious,  
        unable_to_stop_worrying: self.unable_to_stop_worrying,  
        little_interest_or_pleasure: self.little_interest_or_pleasure, 
        depressed: self.depressed,
        pain_injections: self.pain_injections,
        # spine_surgery: self.spine_surgery
    }
  end

  def outcome        
    return {  
      completed_program: self.completed_program,
      recommendation: self.recommendation,  
      outcome_enjoyment_of_life:  self.outcome_enjoyment_of_life,  
      outcome_activity_interference: self.outcome_activity_interference,  
      outcome_anxious: self.outcome_anxious,  
      outcome_unable_to_stop_worrying: self.outcome_unable_to_stop_worrying,  
      outcome_little_interest_or_pleasure: self.outcome_little_interest_or_pleasure, 
      outcome_depressed: self.outcome_depressed 
      } 
    end

  def pain_graph_data
    self.pain_journals.group_by_month(:created_at, format: "%b").average(:intensity)
  end

  def active_goal_updates
    if self.smart_goals.count > 0 
      self.smart_goals.where(status: "active").last.smart_goal_updates.order(:created_at).reverse
    end
  end

end
