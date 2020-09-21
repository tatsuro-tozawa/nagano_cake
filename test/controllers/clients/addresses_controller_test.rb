require 'test_helper'

class Clients::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clients_addresses_new_url
    assert_response :success
  end

  test "should get edit" do
    get clients_addresses_edit_url
    assert_response :success
  end

end
