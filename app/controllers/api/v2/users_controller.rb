module Api
  module V2
    class UsersController < ApplicationController

      def get_journals
        # render json: UserSerializer.new(user).serializable_hash.to_json
      end

      # def show
      #   user.update_wellness_coach_reminder
      #   render json: UserSerializer.new(user).serializable_hash.to_json
      # end

      def show
        if user.present?
          user.update_wellness_coach_reminder
          render json: UserSerializer.new(user).serializable_hash.to_json
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: UserSerializer.new(user).serializable_hash.to_json
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      def update
        if user.update(user_params)
          render json: UserSerializer.new(user).serializable_hash.to_json
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      def destroy
        user = User.find_by(id: params[:id])

        if user.destroy
          head :no_content
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      private

      def user
        @user ||= User.find_by(uid: params[:id])
      end
      
      def user_params
        params.require(:user).permit(
          :first_name,
          :last_name,
          :email, 
          :role, 
          :uid,
          :activity_level, 
          :starting_pain_duration, 
          :starting_pain_score, 
          :enjoyment_of_life,
          :activity_interference,
          :hopes_to_achieve, 
          :anxious,
          :unable_to_stop_worrying,
          :little_interest_or_pleasure,
          :depressed,
          :type_of_pain,
          :pain_injections,
          :spine_surgery,
          :gender,
          :dob,
          :phone,
          :profile_status,
          :provider_id,
          :education_program,
          :expo_push_token,
          :completed_program,
          :recommendation,
          :outcome_enjoyment_of_life,
          :outcome_activity_interference,
          :outcome_anxious,
          :outcome_unable_to_stop_worrying,
          :outcome_little_interest_or_pleasure,
          :outcome_depressed,
          :dates_on_app,
          :last_date_on_app,
          :access_to_wellness_coach,
          :wellness_coach_reminder,
          :wellness_coach_reminded,
          :opt_out_sms,
          saved_movement_units: [],
          skipped_movement_units: [],
          completed_movement_units: []
        )
      end
    end
  end
end