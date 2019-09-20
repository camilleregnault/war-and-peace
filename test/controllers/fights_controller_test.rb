require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fights_index_url
    assert_response :success
  end

  test "should get show" do
    get fights_show_url
    assert_response :success
  end

end
