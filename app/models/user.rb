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
  after_create :send_welcome_message

  enum role: [:standard, :admin]
  enum pace: [:leisurely, :just_right, :zooming]

  def send_welcome_message
    self.received_messages.create(sender_id: 1, body: "Hi #{self.first_name}! Welcome to Pain Navigator. My name’s Kelly and I’m here to help you get the most out of this program. Do you have any questions or comments you’d like to discuss?")
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
      education_module = self.education_modules.last

      return {
        "progress" => education_module.module_id + 1, 
        "last_completed_date" => education_module.created_at.to_f * 1000
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
        "first_name" => self.first_name, 
        "last_name" => self.last_name,
        "email" => self.email,
        "uid" => self.uid,
        "role" => self.role,
        "activity_level" => self.activity_level,
        "starting_pain_duration" => self.starting_pain_duration,
        "starting_pain_score" => self.starting_pain_score,
        "pace" => self.pace,
        "commitment" => self.commitment,
        "gender" => self.gender,
        "dob" => self.dob,
        "phone" => self.phone
    }
  end

end