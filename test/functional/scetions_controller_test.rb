require 'test_helper'

class ScetionsControllerTest < ActionController::TestCase
  setup do
    @scetion = scetions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scetions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scetion" do
    assert_difference('Scetion.count') do
      post :create, scetion: { description: @scetion.description, title: @scetion.title }
    end

    assert_redirected_to scetion_path(assigns(:scetion))
  end

  test "should show scetion" do
    get :show, id: @scetion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scetion
    assert_response :success
  end

  test "should update scetion" do
    put :update, id: @scetion, scetion: { description: @scetion.description, title: @scetion.title }
    assert_redirected_to scetion_path(assigns(:scetion))
  end

  test "should destroy scetion" do
    assert_difference('Scetion.count', -1) do
      delete :destroy, id: @scetion
    end

    assert_redirected_to scetions_path
  end
end
