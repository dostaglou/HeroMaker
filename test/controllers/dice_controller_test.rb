require 'test_helper'

class DiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dice_index_url
    assert_response :success
  end

end
