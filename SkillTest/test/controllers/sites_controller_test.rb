require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sites_new_url
    assert_response :success
  end

  test "should get create" do
    get sites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sites_destroy_url
    assert_response :success
  end

end
