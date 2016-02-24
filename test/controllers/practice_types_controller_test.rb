require 'test_helper'

class PracticeTypesControllerTest < ActionController::TestCase
  setup do
    @practice_type = practice_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practice_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practice_type" do
    assert_difference('PracticeType.count') do
      post :create, practice_type: { title: @practice_type.title }
    end

    assert_redirected_to practice_type_path(assigns(:practice_type))
  end

  test "should show practice_type" do
    get :show, id: @practice_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @practice_type
    assert_response :success
  end

  test "should update practice_type" do
    patch :update, id: @practice_type, practice_type: { title: @practice_type.title }
    assert_redirected_to practice_type_path(assigns(:practice_type))
  end

  test "should destroy practice_type" do
    assert_difference('PracticeType.count', -1) do
      delete :destroy, id: @practice_type
    end

    assert_redirected_to practice_types_path
  end
end
