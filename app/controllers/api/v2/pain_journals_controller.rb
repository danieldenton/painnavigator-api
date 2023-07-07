module Api
  module V2
    class PainJournalsController < ApplicationController
      before_action :get_user

      def index
        pain_journals = PainJournal.all.order(:created_at).reverse

        render json: PainJournalSerializer.new(pain_journals).serializable_hash.to_json
      end

      def create
        pain_journal = @user.pain_journals.new(pain_journal_params)

        if pain_journal.save
          render json: PainJournalSerializer.new(pain_journal).serializable_hash.to_json
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      def update
        pain_journal = PainJournal.find_by(id: params[:id])

        if pain_journal.update(pain_journal_params)
          render json: PainJournalSerializer.new(pain_journal).serializable_hash.to_json
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      def destroy
        pain_journal = PainJournal.find_by(id: params[:id])

        if pain_journal.destroy
          head :no_content
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      private

      def pain_journal_params
        params.require(:pain_journal).permit(
          :user_id, 
          :intensity, 
          :situation, 
          :feeling, 
          :who_i_was_with, 
          :coping_strategies, 
          :notes, 
          :intensity_after,
          :date_time_value,
          :created
        )
      end

    end
  end
end