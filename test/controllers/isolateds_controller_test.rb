require 'test_helper'

class IsolatedsControllerTest < ActionController::TestCase
  setup do
    @isolated = isolateds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isolateds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isolated" do
    assert_difference('Isolated.count') do
      post :create, isolated: { disease: @isolated.disease, n_samples: @isolated.n_samples, name: @isolated.name, organism_id: @isolated.organism_id, origin_id: @isolated.origin_id }
    end

    assert_redirected_to isolated_path(assigns(:isolated))
  end

  test "should show isolated" do
    get :show, id: @isolated
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @isolated
    assert_response :success
  end

  test "should update isolated" do
    patch :update, id: @isolated, isolated: { disease: @isolated.disease, n_samples: @isolated.n_samples, name: @isolated.name, organism_id: @isolated.organism_id, origin_id: @isolated.origin_id }
    assert_redirected_to isolated_path(assigns(:isolated))
  end

  test "should destroy isolated" do
    assert_difference('Isolated.count', -1) do
      delete :destroy, id: @isolated
    end

    assert_redirected_to isolateds_path
  end
end
