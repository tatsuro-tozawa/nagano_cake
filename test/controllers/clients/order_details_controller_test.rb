require 'test_helper'

class Clients::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_order_details_index_url
    assert_response :success
  end

end
