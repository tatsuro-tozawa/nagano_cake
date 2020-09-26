require 'test_helper'

class Clients::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get clients_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get clients_orders_show_url
    assert_response :success
  end

  test "should get thanks" do
    get clients_orders_thanks_url
    assert_response :success
  end

end
