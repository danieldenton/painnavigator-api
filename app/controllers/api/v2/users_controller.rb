module Api
  module V1
    class UsersController < ApplicationController

      def get_journals
        # render json: UserSerializer.new(user).serializable_hash.to_json
      end

      def show
        render json: UserSerializer.new(user).serializable_hash.to_json
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
          :gender,
          :dob,
          :phone,
          :onboard_status,
          :profile_status,
          :provider_id,
          :expo_push_token,
          :completed_program
        )
      end
    end
  end
end