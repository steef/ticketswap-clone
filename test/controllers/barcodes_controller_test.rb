require 'test_helper'

class BarcodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get barcodes_new_url
    assert_response :success
  end

  test "should get create" do
    get barcodes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get barcodes_destroy_url
    assert_response :success
  end

end
