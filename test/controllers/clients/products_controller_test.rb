require 'test_helper'

class Clients::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_products_index_url
    assert_response :success
  end

  test "should get show" do
    get clients_products_show_url
    assert_response :success
  end

end
