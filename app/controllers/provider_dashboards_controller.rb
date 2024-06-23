require 'prawn'

class ProviderDashboardsController < ApplicationController
  before_action :authenticate_provider_dashboard!
  before_action :set_current_provider_dashboard
  before_action :set_users
  before_action :dashboard

  def set_current_provider_dashboard
    date = Date.today
    @current_date = date.strftime("%B %d %Y")
    if provider_dashboard_signed_in?
      @current_provider = current_provider_dashboard
      if params[:provider_id].present?
        @provider = Provider.find(params[:provider_id])
      else
        @provider = Provider.find_by(email: @current_provider.email)
      end
      @total_patient_reimbursement = @provider.users_count * 100 
    end
  end

  def set_users
    @users = User.where(provider_id: @provider.id)
  end

  def dashboard
    @new_user_count_by_month = @users.group_by_month(:created_at).count.transform_keys { |month| month.strftime("%b %Y") }

    @starting_pain_score_counts = {}
    starting_pain_scores = @users.map(&:starting_pain_score)
    (1..10).each do |score| 
      count = starting_pain_scores.count(score)
      @starting_pain_score_counts[score] = count
    end

    user_counts_by_month = @users.group_by_month(:created_at).count
    puts user_counts_by_month
    @cumulative_user_count = {}
    cumulative_count = 0
    user_counts_by_month.each do |month, count|
      cumulative_count += count
      @cumulative_user_count[month.strftime("%b %Y")] = cumulative_count
    end

    @reimbursement_total = @cumulative_user_count.transform_values { |count| count * 100 }

    dates_on_app = @users.map(&:dates_on_app).flatten.map { |date_string| Date.strptime(date_string, "%m/%d/%y") }
    dates_on_app_by_month = dates_on_app.group_by { |date| date.strftime("%m/%Y") }
    sorted_dates_on_app_by_month = dates_on_app_by_month.sort_by { |month, _| Date.strptime(month, "%m/%Y") }.to_h
    @dates_on_app_by_month_count = sorted_dates_on_app_by_month.transform_keys { |month| Date.strptime(month, "%m/%Y").strftime("%b %Y") }.transform_values(&:count)

    @pain_score_trends = Hash.new(0)
    @users.each do |user|
      daily_pain_scores = DailyPainScore.where(user_id: user.id)
      last_pain_score = daily_pain_scores.any? ? daily_pain_scores.last.score : nil 
      if last_pain_score
        pain_score_trend = last_pain_score - user.starting_pain_score
        @pain_score_trends[pain_score_trend] += 1
      end
    end
  end

  def user_list
    @ordered_users = @users.order(:last_name)
  end

  def provider_list
    @providers = Provider.all
  end

  def download_pdf
    @data = dashboard

    respond_to do |format|
      format.pdf do
        pdf = generate_pdf(@data)
        send_data pdf.render, filename: "provider-data-#{Date.today}.pdf", type: "application/pdf", disposition: "attachment"
      end
    end
  end

  def generate_pdf(data)
    Prawn::Document.new do |pdf|
      pdf.text "PainNavigator Provider Data", size: 20, style: :bold
      pdf.move_down 10
      pdf.text "Total Patients to Date: #{@provider.users_count}"
      pdf.text "Total Patient Reimbursement: #{@total_patient_reimbursement}"
      pdf.move_down 10
      pdf.text "New User Count By Month:"
      @new_user_count_by_month.each do |month|
        pdf.text "#{month.month}: #{month.count}"
      end
      pdf.move_down 10
      pdf.text "Cumulative User Count:"
      @cumulative_user_count.each do |month|
        pdf.text "#{month.month}: #{month.count}"
      end
      pdf.move_down 10
      pdf.text "Starting Pain Scores:"
      @starting_pain_score_counts.each do |score|
        pdf.text "#{score.score}: #{score.count}"
      end
      pdf.move_down 10
      pdf.text "Pain Score Imrovement (negaive change = pain is improving):"
      @pain_score_trends.each do |score|
        pdf.text "#{score.score}: #{score.count}"
      end
      pdf.move_down 10
      pdf.text "Logins Per Month:"
      @dates_on_app_by_month_count.each do |month|
        pdf.text "#{month.month}: #{month.count}"
      end
      pdf.move_down 10
      pdf.text "Reimbursement Running Total:"
      @reimbursement_total.each do |month|
        pdf.text "#{month.month}: #{month.count}"
      end
    end
  end

end