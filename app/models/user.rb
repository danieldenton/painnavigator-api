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

  #def condensed_program 
    #provider.condensed_program
  #end

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
    self.received_messages.create(sender_id: 1, body: "Hi #{self.first_name}! Welcome to PainNavigator! My name's Marina. I'm your PainNavigator Wellness Coach, here to help you get the most out of the program. Feel free to ask me any questions here!")
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
      return {
        "progress" => self.education_modules.last.module_id + 1,
        "last_completed_date" => education_modules.last.created_at.to_f * 1000,
      }

      #if condensed_program
        #units = EducationUnit.where("id > ?", education_modules.last.module_id).where({ :condensed_program => true })
        #@current_unit_id = units.first.id
      #else 
        #units = EducationUnit.where("id > ?", education_modules.last.module_id)
        #@current_unit_id = units.first.id
      #end
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
        activity_level: self.activity_level,
        starting_pain_duration: self.starting_pain_duration,
        starting_pain_score: self.starting_pain_score,
        pace: self.pace,
        commitment: self.commitment,
        gender: self.gender,
        dob: self.dob,
        phone: self.phone
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