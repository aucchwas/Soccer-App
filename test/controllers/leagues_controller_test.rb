require "test_helper"

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get inedx" do
    get leagues_inedx_url
    assert_response :success
  end

  test "should get show" do
    get leagues_show_url
    assert_response :success
  end
end
