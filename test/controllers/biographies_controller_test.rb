require 'test_helper'

class BiographiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get biographies_show_url
    assert_response :success
  end

  test "should get new" do
    get biographies_new_url
    assert_response :success
  end

  test "should get edit" do
    get biographies_edit_url
    assert_response :success
  end

end
