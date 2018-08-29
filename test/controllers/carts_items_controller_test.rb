require 'test_helper'

class CartsItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carts_items_create_url
    assert_response :success
  end

end
