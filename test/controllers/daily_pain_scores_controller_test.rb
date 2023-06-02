require "test_helper"

class DailyPainScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_pain_score = daily_pain_scores(:one)
  end

  test "should get index" do
    get daily_pain_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_pain_score_url
    assert_response :success
  end

  test "should create daily_pain_score" do
    assert_difference('DailyPainScore.count') do
      post daily_pain_scores_url, params: { daily_pain_score: { daily_scores: @daily_pain_score.daily_scores, user_id: @daily_pain_score.user_id } }
    end

    assert_redirected_to daily_pain_score_url(DailyPainScore.last)
  end

  test "should show daily_pain_score" do
    get daily_pain_score_url(@daily_pain_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_pain_score_url(@daily_pain_score)
    assert_response :success
  end

  test "should update daily_pain_score" do
    patch daily_pain_score_url(@daily_pain_score), params: { daily_pain_score: { daily_scores: @daily_pain_score.daily_scores, user_id: @daily_pain_score.user_id } }
    assert_redirected_to daily_pain_score_url(@daily_pain_score)
  end

  test "should destroy daily_pain_score" do
    assert_difference('DailyPainScore.count', -1) do
      delete daily_pain_score_url(@daily_pain_score)
    end

    assert_redirected_to daily_pain_scores_url
  end
end
