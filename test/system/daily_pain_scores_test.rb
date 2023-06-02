require "application_system_test_case"

class DailyPainScoresTest < ApplicationSystemTestCase
  setup do
    @daily_pain_score = daily_pain_scores(:one)
  end

  test "visiting the index" do
    visit daily_pain_scores_url
    assert_selector "h1", text: "Daily Pain Scores"
  end

  test "creating a Daily pain score" do
    visit daily_pain_scores_url
    click_on "New Daily Pain Score"

    fill_in "Daily scores", with: @daily_pain_score.daily_scores
    fill_in "User", with: @daily_pain_score.user_id
    click_on "Create Daily pain score"

    assert_text "Daily pain score was successfully created"
    click_on "Back"
  end

  test "updating a Daily pain score" do
    visit daily_pain_scores_url
    click_on "Edit", match: :first

    fill_in "Daily scores", with: @daily_pain_score.daily_scores
    fill_in "User", with: @daily_pain_score.user_id
    click_on "Update Daily pain score"

    assert_text "Daily pain score was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily pain score" do
    visit daily_pain_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily pain score was successfully destroyed"
  end
end
