require 'test_helper'

class InstructionalsControllerTest < ActionController::TestCase
  setup do
    @instructional = instructionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instructionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instructional" do
    assert_difference('Instructional.count') do
      post :create, instructional: { text: @instructional.text, title: @instructional.title }
    end

    assert_redirected_to instructional_path(assigns(:instructional))
  end

  test "should show instructional" do
    get :show, id: @instructional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instructional
    assert_response :success
  end

  test "should update instructional" do
    patch :update, id: @instructional, instructional: { text: @instructional.text, title: @instructional.title }
    assert_redirected_to instructional_path(assigns(:instructional))
  end

  test "should destroy instructional" do
    assert_difference('Instructional.count', -1) do
      delete :destroy, id: @instructional
    end

    assert_redirected_to instructionals_path
  end
end
