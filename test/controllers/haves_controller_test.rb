require 'test_helper'

class HavesControllerTest < ActionController::TestCase
  setup do
    @hafe = haves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:haves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hafe" do
    assert_difference('Have.count') do
      post :create, hafe: { mutation_id: @hafe.mutation_id, publication_id: @hafe.publication_id }
    end

    assert_redirected_to hafe_path(assigns(:hafe))
  end

  test "should show hafe" do
    get :show, id: @hafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hafe
    assert_response :success
  end

  test "should update hafe" do
    patch :update, id: @hafe, hafe: { mutation_id: @hafe.mutation_id, publication_id: @hafe.publication_id }
    assert_redirected_to hafe_path(assigns(:hafe))
  end

  test "should destroy hafe" do
    assert_difference('Have.count', -1) do
      delete :destroy, id: @hafe
    end

    assert_redirected_to haves_path
  end
end
