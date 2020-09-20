require 'test_helper'

class Clients::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clients_mypage_show_url
    assert_response :success
  end

  test "should get edit" do
    get clients_mypage_edit_url
    assert_response :success
  end

end
