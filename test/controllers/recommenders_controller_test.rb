require 'test_helper'

class RecommendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recommenders_index_url
    assert_response :success
  end

  test "should get rate" do
    get recommenders_rate_url
    assert_response :success
  end

  test "should get show" do
    get recommenders_show_url
    assert_response :success
  end

end
