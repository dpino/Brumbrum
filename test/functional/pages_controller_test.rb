require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get terms_and_cons" do
    get :terms_and_cons
    assert_response :success
  end

end
