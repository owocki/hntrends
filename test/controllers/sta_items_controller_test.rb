require 'test_helper'

class StaItemsControllerTest < ActionController::TestCase
  setup do
    @sta_item = sta_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sta_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sta_item" do
    assert_difference('StaItem.count') do
      post :create, sta_item: { by: @sta_item.by, dead: @sta_item.dead, deleted: @sta_item.deleted, descendants: @sta_item.descendants, kids: @sta_item.kids, parent: @sta_item.parent, parts: @sta_item.parts, score: @sta_item.score, text: @sta_item.text, time: @sta_item.time, title: @sta_item.title, type: @sta_item.type, updated: @sta_item.updated, url: @sta_item.url }
    end

    assert_redirected_to sta_item_path(assigns(:sta_item))
  end

  test "should show sta_item" do
    get :show, id: @sta_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sta_item
    assert_response :success
  end

  test "should update sta_item" do
    patch :update, id: @sta_item, sta_item: { by: @sta_item.by, dead: @sta_item.dead, deleted: @sta_item.deleted, descendants: @sta_item.descendants, kids: @sta_item.kids, parent: @sta_item.parent, parts: @sta_item.parts, score: @sta_item.score, text: @sta_item.text, time: @sta_item.time, title: @sta_item.title, type: @sta_item.type, updated: @sta_item.updated, url: @sta_item.url }
    assert_redirected_to sta_item_path(assigns(:sta_item))
  end

  test "should destroy sta_item" do
    assert_difference('StaItem.count', -1) do
      delete :destroy, id: @sta_item
    end

    assert_redirected_to sta_items_path
  end
end
