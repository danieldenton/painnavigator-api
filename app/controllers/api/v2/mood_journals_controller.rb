module Api
  module V2
    class MoodJournalsController < ApplicationController
      before_action :find_user_by_uid, only: [:index, :create]

      def find_user_by_uid
        @user = User.find_by(uid: params[:uid])
        render json: { error: 'User not found' }, status: :not_found unless @user
      end

      def index
        @mood_journals = @user.mood_journals
        render json: @mood_journals
      end

      def create
        mood_journal = @user.mood_journals.new(mood_journal_params)

        if mood_journal.save
          render json: MoodJournalSerializer.new(mood_journal).serializable_hash.to_json
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      def update
        mood_journal = MoodJournal.find_by(id: params[:id])

        if mood_journal.update(mood_journal_params)
          render json: MoodJournalSerializer.new(mood_journal).serializable_hash.to_json
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      def destroy
        mood_journal = MoodJournal.find_by(id: params[:id])

        if mood_journal.destroy
          head :no_content
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      private

      def mood_journal_params
        params.require(:mood_journal).permit(
          :user_id, 
          :intensity, 
          :situation, 
          :feeling, 
          :who_i_was_with, 
          :primary_thought, 
          :cognitive_distortions,
          :date_time_value,
          :created
        )
      end
    end
  end
end