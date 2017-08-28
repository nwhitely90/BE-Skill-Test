require 'test_helper'

class ProductDetailControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get product_detail_controller_new_url
    assert_response :success
  end

  test "should get index" do
    get product_detail_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get product_detail_controller_show_url
    assert_response :success
  end

end
