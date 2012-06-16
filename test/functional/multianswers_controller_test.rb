require 'test_helper'

class MultianswersControllerTest < ActionController::TestCase
  setup do
    @multianswer = multianswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multianswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multianswer" do
    assert_difference('Multianswer.count') do
      post :create, multianswer: { answer_id: @multianswer.answer_id, response_id: @multianswer.response_id, selected: @multianswer.selected }
    end

    assert_redirected_to multianswer_path(assigns(:multianswer))
  end

  test "should show multianswer" do
    get :show, id: @multianswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multianswer
    assert_response :success
  end

  test "should update multianswer" do
    put :update, id: @multianswer, multianswer: { answer_id: @multianswer.answer_id, response_id: @multianswer.response_id, selected: @multianswer.selected }
    assert_redirected_to multianswer_path(assigns(:multianswer))
  end

  test "should destroy multianswer" do
    assert_difference('Multianswer.count', -1) do
      delete :destroy, id: @multianswer
    end

    assert_redirected_to multianswers_path
  end
end
