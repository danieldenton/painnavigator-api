require "test_helper"

class ProviderUsersDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get provider_users_dashboard_user_url
    assert_response :success
  end
end
