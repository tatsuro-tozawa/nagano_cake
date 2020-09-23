require 'test_helper'

class Clients::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_cart_products_index_url
    assert_response :success
  end

end
