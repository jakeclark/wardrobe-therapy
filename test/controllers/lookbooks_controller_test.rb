require 'test_helper'

class LookbooksControllerTest < ActionController::TestCase
  setup do
    @lookbook = lookbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lookbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lookbook" do
    assert_difference('Lookbook.count') do
      post :create, lookbook: { category: @lookbook.category, description: @lookbook.description, event: @lookbook.event, look: @lookbook.look, season: @lookbook.season, user_id: @lookbook.user_id, year: @lookbook.year }
    end

    assert_redirected_to lookbook_path(assigns(:lookbook))
  end

  test "should show lookbook" do
    get :show, id: @lookbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lookbook
    assert_response :success
  end

  test "should update lookbook" do
    patch :update, id: @lookbook, lookbook: { category: @lookbook.category, description: @lookbook.description, event: @lookbook.event, look: @lookbook.look, season: @lookbook.season, user_id: @lookbook.user_id, year: @lookbook.year }
    assert_redirected_to lookbook_path(assigns(:lookbook))
  end

  test "should destroy lookbook" do
    assert_difference('Lookbook.count', -1) do
      delete :destroy, id: @lookbook
    end

    assert_redirected_to lookbooks_path
  end
end
