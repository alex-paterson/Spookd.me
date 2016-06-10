require 'test_helper'

class TagJoinsControllerTest < ActionController::TestCase
  setup do
    @tag_join = tag_joins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_joins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_join" do
    assert_difference('TagJoin.count') do
      post :create, tag_join: { story_id: @tag_join.story_id, tag_id: @tag_join.tag_id }
    end

    assert_redirected_to tag_join_path(assigns(:tag_join))
  end

  test "should show tag_join" do
    get :show, id: @tag_join
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_join
    assert_response :success
  end

  test "should update tag_join" do
    patch :update, id: @tag_join, tag_join: { story_id: @tag_join.story_id, tag_id: @tag_join.tag_id }
    assert_redirected_to tag_join_path(assigns(:tag_join))
  end

  test "should destroy tag_join" do
    assert_difference('TagJoin.count', -1) do
      delete :destroy, id: @tag_join
    end

    assert_redirected_to tag_joins_path
  end
end
