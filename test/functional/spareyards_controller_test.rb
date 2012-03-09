require 'test_helper'

class SpareyardsControllerTest < ActionController::TestCase
  setup do
    @spareyard = spareyards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spareyards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spareyard" do
    assert_difference('Spareyard.count') do
      post :create, spareyard: @spareyard.attributes
    end

    assert_redirected_to spareyard_path(assigns(:spareyard))
  end

  test "should show spareyard" do
    get :show, id: @spareyard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spareyard
    assert_response :success
  end

  test "should update spareyard" do
    put :update, id: @spareyard, spareyard: @spareyard.attributes
    assert_redirected_to spareyard_path(assigns(:spareyard))
  end

  test "should destroy spareyard" do
    assert_difference('Spareyard.count', -1) do
      delete :destroy, id: @spareyard
    end

    assert_redirected_to spareyards_path
  end
end
