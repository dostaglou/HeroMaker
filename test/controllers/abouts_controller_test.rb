require 'test_helper'

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get abouts_new_url
    assert_response :success
  end

  test "should get edit" do
    get abouts_edit_url
    assert_response :success
  end

end
