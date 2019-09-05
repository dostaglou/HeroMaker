require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get characters_show_url
    assert_response :success
  end

  test "should get new" do
    get characters_new_url
    assert_response :success
  end

  test "should get edit" do
    get characters_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get characters_destroy_url
    assert_response :success
  end

end
