require 'test_helper'

class FrontBaseControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get front_base_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get front_base_controller_create_url
    assert_response :success
  end

  test "should get destroy" do
    get front_base_controller_destroy_url
    assert_response :success
  end

end
