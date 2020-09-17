require 'test_helper'

class Clienst::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get clienst_homes_top_url
    assert_response :success
  end

end
