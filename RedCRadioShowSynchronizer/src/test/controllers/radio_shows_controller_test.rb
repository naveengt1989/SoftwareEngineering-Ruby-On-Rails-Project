require 'test_helper'

class RadioShowsControllerTest < ActionController::TestCase
  setup do
    @radio_show = radio_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:radio_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create radio_show" do
    assert_difference('RadioShow.count') do
      post :create, radio_show: { description: @radio_show.description, name: @radio_show.name, user_id: @radio_show.user_id }
    end

    assert_redirected_to radio_show_path(assigns(:radio_show))
  end

  test "should show radio_show" do
    get :show, id: @radio_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @radio_show
    assert_response :success
  end

  test "should update radio_show" do
    patch :update, id: @radio_show, radio_show: { description: @radio_show.description, name: @radio_show.name, user_id: @radio_show.user_id }
    assert_redirected_to radio_show_path(assigns(:radio_show))
  end

  test "should destroy radio_show" do
    assert_difference('RadioShow.count', -1) do
      delete :destroy, id: @radio_show
    end

    assert_redirected_to radio_shows_path
  end
end
