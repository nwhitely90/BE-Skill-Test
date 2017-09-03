require 'test_helper'

class FrontSiteControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get front_site_new_url
    assert_response :success
  end

  test "should get index" do
    get front_site_index_url
    assert_response :success
  end

  test "should get show" do
    get front_site_show_url
    assert_response :success
  end

end
