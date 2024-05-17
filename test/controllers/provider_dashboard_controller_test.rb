require "test_helper"

class ProviderDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get provider_dashboard_dashboard_url
    assert_response :success
  end
end
