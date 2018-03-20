require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listings_index_url
    assert_response :success
  end

  test "should get show" do
    get listings_show_url
    assert_response :success
  end

  test "should get new" do
    get listings_new_url
    assert_response :success
  end

  test "should get create" do
    get listings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get listings_destroy_url
    assert_response :success
  end

end
